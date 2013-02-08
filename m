Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3lUi-0003oh-EU
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 11:47:54 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so1736950dan.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 02:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=EaDF0Vb2Octqjvkf9A+fEaNSND/9wAgbVrBe5tjaHVQ=;
	b=KCivBj8XjltpQrjzf9otbchncUq6A5T0UI58xhjHAKVX0csb8McpVkE7SJ2R7gXsm0
	A7Cjs9kfhI+w+4UY3PDscSoSAeAOdOHVk37QrUK+wb24XqNn0SmeLvTBD0ZO9Zmc2YAV
	m+GP3/Qewx2tOG4e/njG2LvWhvryjnwqIZLlpF+EBP6qw/cxqj+sTOYZ0+fwnMyFqUwo
	lr3YzUwhaYCTa3igsPU25mclzQrzVk5G3YQd50H+gkPF9THQAPgZYDl+9Hc/BBcdyqWj
	bU+0MqjB/IsEthD8b/aznSEHt0G93ur7RVt3rXvy6yzA0zx8wgQ92GQARGgQXgHeL7qP
	aiFg==
X-Received: by 10.66.84.3 with SMTP id u3mr15736145pay.51.1360319513999; Fri,
	08 Feb 2013 02:31:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.193.225 with HTTP; Fri, 8 Feb 2013 02:31:32 -0800 (PST)
In-Reply-To: <4ac0c041b62e5495bff97bd2d7dc5a4e31d7ce5f.1360166922.git.laurentiu.palcu@intel.com>
References: <cover.1360166922.git.laurentiu.palcu@intel.com>
	<4ac0c041b62e5495bff97bd2d7dc5a4e31d7ce5f.1360166922.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 10:31:32 +0000
Message-ID: <CAJTo0LYGpC4qpjyMEms2M=wX0DYypNDJ1pjg-79xu4yMh69byg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQlsB0pwsrclJP/RcScWKPXCuAWuhb+8fOE+sMhmLFqfZCCAhs4eBcPw1lGiOjCP9JhLrkBm
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] Add pixbufcache class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 10:47:55 -0000
Content-Type: text/plain; charset=UTF-8

On 6 February 2013 16:36, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> All packages exporting pixbuf loaders should inherit this class in order
> to generate the correct postinst/postrm scriptlets.
>
> [YOCTO #3852]

Presumably this means that the gtk-icon-cache package can drop the
pixbuf loader calls now?  Also as the gtk icon cache only handles
built-in modules, we don't need to update the icon cache when
registering pixbuf loaders.

Ross


