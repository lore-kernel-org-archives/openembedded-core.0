Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RE4ED-0001cN-0y
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 21:12:33 +0200
Received: by qyk10 with SMTP id 10so5406581qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=qkeW/QU8jMw1svaOXlyNF4qT05FNoYPHyESAyqNf6jY=;
	b=TEj7sROIxO1O7HnCf4FZJoh2yrX0VLw/jlzS0V26TIaCVU+NXnF19CxjkCcwwQOT8B
	zCE9IvbupZnEYyufgCD+DoVxnTKx22NYjsijpTwE60mh2DiL7ovJEUjamnM382PGCPyG
	5TMyGd6fzFDu5ANRDCt8yXkIbtF/SoqJk4Gqw=
Received: by 10.229.248.195 with SMTP id mh3mr90210qcb.56.1318446409675;
	Wed, 12 Oct 2011 12:06:49 -0700 (PDT)
Received: from [172.23.0.171] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ef8sm4039104qab.12.2011.10.12.12.06.47
	(version=SSLv3 cipher=OTHER); Wed, 12 Oct 2011 12:06:48 -0700 (PDT)
Message-ID: <4E95E543.803@gmail.com>
Date: Wed, 12 Oct 2011 12:06:43 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1318426596.23801.160.camel@ted>
In-Reply-To: <1318426596.23801.160.camel@ted>
Subject: Re: [PATCH] Import python-setuptools from meta-oe (for glib-2.0)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 19:12:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2011 6:36 AM, Richard Purdie wrote:
> +DEPENDS += "python"
> +DEPENDS_virtclass-native += "python-native"
> +

wouldnt BBCLASSEXTEND convert python into python-native ?


