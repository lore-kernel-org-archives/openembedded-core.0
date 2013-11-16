Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id E2CD76DA11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 00:29:08 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id x16so11085vbf.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 16:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=R8POO2QAl7ZdEZj5XxwrFLTyepsODZBebWTHDQ0r75M=;
	b=Hi87TuZAtJpPyvSi0V4e9lwC/2MqN/JGgN0KfTeDcBi9j3FyJdm7yDhKxPyS4qdusx
	y+r1bhEkJO76a6V1OEBxking9cnz9sHQzvKb7sciznMhMHZfIP77y4Rk/rCSX+SNOQl/
	vbVpJ0DmWDvgiQCZNZcXnRTVrhzp/CUAf5k0lW7ooB84QhinIbiU6ANamabAGByTcubR
	N/a6rxtvuCH9UrfJ/jYnfEZTRHt0TGsGJUU+Sgkf9phpeehlshcvVJ2axiLLxCsckcbx
	beOtFOfBwPFJds8kd+MuuVHvXnJrVPhoBQ+PXA87QqxZxloQhJcaFr7Y69tKkPj25GA+
	9WYw==
X-Gm-Message-State: ALoCoQlVklq9uVFw3LM8XCCAbYmAsHG/+s0QdLGIAhkOgOmji9vg16q7l/pXfsUiC2Cij5EaRJAE
X-Received: by 10.58.254.38 with SMTP id af6mr1232ved.85.1384561750292; Fri,
	15 Nov 2013 16:29:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 15 Nov 2013 16:28:49 -0800 (PST)
In-Reply-To: <CAP9ODKo1kQoT4LeP-spHHtb1NUSmx6ujswohvdpJT0EgbA9M6w@mail.gmail.com>
References: <1384559680-28033-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKo1kQoT4LeP-spHHtb1NUSmx6ujswohvdpJT0EgbA9M6w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 16 Nov 2013 00:28:49 +0000
Message-ID: <CAJTo0LZTt=+H+1pyg=wZ_2-e6AMgL5XnBeEc=ULVCX0YHvKfyg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: remove reference to gles in PACKAGECONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Nov 2013 00:29:09 -0000
Content-Type: text/plain; charset=UTF-8

On 16 November 2013 00:26, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Fri, Nov 15, 2013 at 9:54 PM, Ross Burton <ross.burton@intel.com> wrote:
>> The "gles" configuration was removed in the upgrade to 1.3.0, and it was enabled
>> only if the unknown/rare opengles2 DISTRO_FEATURE was enabled.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Please don't remove this. We depend on this for use in meta-fsl-arm :)
>
> Cairo should be fixed to bring it back :D

As discussed on IRC, Patches Welcome. :)  The conditional *is* wrong though.

Ross

