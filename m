Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6C9760AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 23:53:08 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m5so3838382pgk.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 16:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=mxK4tL3DkjNuAiStwfheNVeHMHDU+ZYoWOhdKEy7wcQ=;
	b=bMkW9GobBC3ueknIgqyyfBuYasC3J3VRMIrctRgcdKpplpRj1Rezs30JxIgRm8gynd
	SRbIHsPTTDDtaR17pNDB2M8I9uWWbM3f33XIFbPSwY1IK4XW5yI0Wzrj3507snF8Yzia
	+Zm7BHEXWsZIcr0oFT7h/1NYyIR+k91uDvIFaG6jeB8Kaw0/oJoT5aKHPaeQ5ebMEwPK
	AkoUA9eEq+ug22O/2gg5TrAqYkJjmZQMzvJjki8+UdGV10sntFVR8exLHYne8epC9Uuw
	VARGxUKHgz9KIH3ShUBzndbFMPGB+1aEYSu/r9OSHxBLvQUQ3YyeCwccCy4hwyRc6rsA
	vjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=mxK4tL3DkjNuAiStwfheNVeHMHDU+ZYoWOhdKEy7wcQ=;
	b=FFHOx1+UQZZdNf2XXEniK6LFcvKJgWrfQjmx/VX3h47P7o8p/MKSHvXiMUCLX0jztv
	H+Gh2XDQGTxnUBfyJ4LHL3mHorglTbt46rQkg+0WKztNFyFBEh49Am+Anp7xHVdq30Xc
	kHVNbW2j4xmCG0+nFrGov3BwreVI1VRCJsIQXc8D8ZpZ8uHiZ2GqSBIjGLDroK2Ru7ki
	LX34fE94XsBFkhfwMzNxpAaZ0zOcJHu8Q1YR6KNXHx7AJ3M1m5f5Gr+eV4W8WAZoV6Md
	p4+10v7E9Dej8yBemQzAkvZEXiK9TfvIlVjj+kFwVCBStx6jjbtQZKxE350RGp+E2Y73
	X3/w==
X-Gm-Message-State: AFeK/H1RIxtn6OLoPwnc8Auz6PSOCfDABtTpgZd3kqzliQxa8WvesDrEKJedFAiUraDCuw==
X-Received: by 10.98.163.17 with SMTP id s17mr6804586pfe.61.1489621988533;
	Wed, 15 Mar 2017 16:53:08 -0700 (PDT)
Received: from [10.5.7.41] ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	p77sm6289476pfj.99.2017.03.15.16.53.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 16:53:07 -0700 (PDT)
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1489606752-37886-1-git-send-email-juro.bystricky@intel.com>
	<1489606752-37886-2-git-send-email-juro.bystricky@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0e662216-a60c-967c-107a-0d78da902b27@gmail.com>
Date: Wed, 15 Mar 2017 16:53:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1489606752-37886-2-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com, jurobystricky@hotmmail.com
Subject: Re: [morty][PATCH 1/1] sanity.bbclass: modify check for shell
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
X-List-Received-Date: Wed, 15 Mar 2017 23:53:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 03/15/2017 12:39 PM, Juro Bystricky wrote:
> Due to the recently implemented update-alternatives for bash binary,
> sanity checker may end up with a (false-positive) error such as:
>
> Error, /bin/sh links to /bin/bash.bash, must be dash or bash
>
> This patch modifies the test: presence of "/bash" or "/dash" in shell binary
> name results in pass.
ok. got it in my pre-stagging.
thanks
- armin
>
> [YOCTO#11108]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>   meta/classes/sanity.bbclass | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 7682ffb..a11b581 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -929,7 +929,9 @@ def check_sanity_everybuild(status, d):
>       # If /bin/sh is a symlink, check that it points to dash or bash
>       if os.path.islink('/bin/sh'):
>           real_sh = os.path.realpath('/bin/sh')
> -        if not real_sh.endswith('/dash') and not real_sh.endswith('/bash'):
> +        # Due to update-alternatives, the shell name may take various
> +        # forms, such as /bin/dash, bin/bash, /bin/bash.bash ...
> +        if '/dash' not in real_sh and '/bash' not in real_sh:
>               status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
>   
>   def check_sanity(sanity_data):


