Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED9F789B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:05:11 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id p10-v6so7742327ljg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hR87Fm9j/P4+qlc3brkBG/PLa1Adw+BObWiopcxSwgQ=;
	b=g26Uz1m5kZF4GINHxA05v/sA/UtQv2NpvkJfG5MuukW7j5xtzEayNVkyDtz4+i1Vyj
	3a2KTy5WJpzwhkMZaNE6XcwNuouAGdmKEeIe0KuJG4rX7ErQNhY5WMmLQmSX4iynvOBI
	Ib8/eQ5sXFOtUTU9AJFLOoZF6iLvRVMqgagmO+6aFadlEjC9E15DZEiFuOysdvDCSaCe
	X3h6rbMGKxC6wYCYkYsPpOz45E14LCJExRXSObIQl4r+DuJG5Qf9bvnYelT2uhgcE6N8
	u1MgyLjPYynEoAFREO3jssBWuciYmSHE2PnHAs1WEJAnsF/2y6oc5OUgaOCT4dv47ui+
	rX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hR87Fm9j/P4+qlc3brkBG/PLa1Adw+BObWiopcxSwgQ=;
	b=NvksibU/0aok2vwZDlsXjknp19Wt3LV7E0C+eSCUUzassQkFYY0pQLxlMk07iHxQcZ
	pkp8Bzz6Z/aTNjH1+oKai8GBjwWm2IBwJgReEcKoVs6uh0GDM8xgfktavja6m3fGPo6F
	MKNqADXYU7npAcHIr+NuikvVvbk6Bv7+YS24se4D8v2SfsFUg9uh2fLjj87+wxhqcxye
	62rhvm005aROd8t7vOrfFz44TssCcbURSlX9FYRS12TZKmNlzrXNfwhiqNO+hhAEEZo4
	Sp30XO+E+ZfZggeNy6DV6eW/KkLhg9U8b55VXrcjjADUCg//JMswjBMg1B2O4orMku7O
	2oTA==
X-Gm-Message-State: AOUpUlFeHat/O6kR8EajwdEjtOykd8fR9wtb9SK42L6wvnDRJmY40rSD
	lcZAX6QePp4v0debwaJxtlVFWMDekf6KcpdHNk4=
X-Google-Smtp-Source: AAOMgpdfASOELcBeaw7/D3JxTH1M5dj6l1vM0ortqtXzyAr6BPigzo8R6SZq9qlKDwNxxLsnViYCP4JNO2yNKYpFUFA=
X-Received: by 2002:a2e:6a04:: with SMTP id
	f4-v6mr16892969ljc.109.1532549112092; 
	Wed, 25 Jul 2018 13:05:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:85a:0:0:0:0:0 with HTTP;
	Wed, 25 Jul 2018 13:05:10 -0700 (PDT)
In-Reply-To: <CAJTo0LZZU9_XSu3+HBmDEjKFgS_znfTkdyzBSd-XChXaEncnow@mail.gmail.com>
References: <20180725183529.4478-1-JPEWhacker@gmail.com>
	<CAJTo0LZZU9_XSu3+HBmDEjKFgS_znfTkdyzBSd-XChXaEncnow@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Jul 2018 16:05:10 -0400
Message-ID: <CADkTA4MOJMPrdbxuFUp5Nchv=2MJaztUpmodRqC7QPrRWaZg9g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Cleanup getstatusoutput usage
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
X-List-Received-Date: Wed, 25 Jul 2018 20:05:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 25, 2018 at 3:50 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 25 July 2018 at 19:35, Joshua Watt <jpewhacker@gmail.com> wrote:
>> -    cmd = d.expand("cd ${S}; kconf_check --report -o ${S}/%s/cfg/ ${B}/.config ${S} %s" % (kmeta,configs))
>> -    ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
>> +    try:
>> +        configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
>> +    except subprocess.CalledProcessError:
>> +        # Is this really non-fatal?
>> +        pass
>> +
>> +    try:
>> +        subprocess.check_call(['kconf_check', '--report', '-o',
>> +                '%s/%s/cfg' % (s, kmeta), d.getVar('B') + '/.config', s, configs], cwd=s, env=env)
>> +    except subprocess.CalledProcessError:
>> +        # Is this really non-fatal?
>> +        pass
>
> CCing Bruce for his feedback.  Either one or both of these calls can
> fail without it being fatal which should be documented, or it
> shouldn't be catching the exceptions.

Yah.

Don't grab this patch at all. I have a set of changes that muck all
about in here, so I'll have to look and integrate things by hand.

My question about the change .. is why ? I really don't like cleanup
patches on principle, and want things pinned to a bug, a performance
issue or something else.

Cheers,

Bruce

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

