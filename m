Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id A1E95745AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 19:43:04 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 188-v6so13630490oid.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 12:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cLeWo0kauGvTJqeCX3KFGvgHPkFo1rUv91bkF7AeCO4=;
	b=Xflv9SPgywJ3peidaDxdsCgkDl/mKhqQ2fgvbitN7M9fGhQTYaCMEO2WdJg2uPhEmO
	5xgexLXdjwOX0gKxEQPHVJU5EmywL0X31RIFWfPcqnHOsSbH1G/XYevd2O91+fayc7Ty
	FS7+o9vND8iQu7qgWUCJg8xKmyCVi1yX0NGwrzx6d4kF4b29hMdCWqxrV8toXPMg3NGu
	uLrKUSLJANDBLV8oklZfrzt6iABgPNIEW1uDiPyQz9V2BWQ1xg+FPjumq+vtZAUcRdlQ
	Bgv1l+E/+jxHwgvervRFh2UQd0mgWMtQ+q2VbIDyeiWEdIvdCqxULGTNOXHc/FyCFCz7
	L9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cLeWo0kauGvTJqeCX3KFGvgHPkFo1rUv91bkF7AeCO4=;
	b=YXLdDwTLY9qfX0VbLxurKbZ950bBUDHSYpyCO7/hXw37MfWUhckO8gYuqQfm77uUKn
	QX2nO7PB4sIJiVpdRgEd95759zFUTGeF2TCkZagjEpLWaN8NHlGPW7UJgIOj0Tc7KZbd
	9XM267y8GqCrMAQ/qy+bjb4xQroj/YnkZot9KYNyJPv6HY/CbSUX8RQ0blnNcbXDvTPi
	87r9/79Q/ZSw4inNEwWatBLwYmEaqUps/IPjEOsd/gUVHuajZG/Vb9d2CvAgPDAwJ7tb
	0CKlZYWX4EmHLnEoPrsWKPVa1mgC7veUruH+qESG5b5e4AfYa7p7tT2av2acWot6dEGX
	cnVg==
X-Gm-Message-State: APt69E1SMQQPhbcanULGaf/r6UGjpisiJbVPyEs5qfgCxL7GTmHScoJB
	Q8Aj8rdTSKX3ep7SNWfVZQrwhXMAOt/V9r7QVl4=
X-Google-Smtp-Source: AAOMgpePGt7U3DAyifcJCLoWBCHaGIkS3Pe9jKYWgcZIGTJiv4RgiDXthCl+3jRt+MSjkABm/+oOvgujVHXNZwoJRTE=
X-Received: by 2002:aca:4fcf:: with SMTP id
	d198-v6mr1917330oib.51.1529955785721; 
	Mon, 25 Jun 2018 12:43:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 12:43:05
	-0700 (PDT)
In-Reply-To: <CANNYZj-MKfxraD-Ho6_Rej3R8dXSAWo3-JtZvQ4SanH183uWvA@mail.gmail.com>
References: <20180625092738.17962-1-olofjn@axis.com>
	<CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
	<7693ed11-5b51-52f6-08f9-4e4f9b76fa90@windriver.com>
	<CANNYZj-MKfxraD-Ho6_Rej3R8dXSAWo3-JtZvQ4SanH183uWvA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Jun 2018 21:43:05 +0200
Message-ID: <CANNYZj_tSbtCh13rCUVYW0iqozQ65q+OufCgVGSW96J11wibEA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Olof Johansson <olofjn@axis.com>
Subject: Re: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Mon, 25 Jun 2018 19:43:04 -0000
Content-Type: text/plain; charset="UTF-8"

The temporary files are written here (macros.in file):

%_tmppath               %{_var}/tmp

What I don't understand is why they end up in the host /var and not
the rootfs one. The rpm database location is deduced from to _var as
well, and it does get created in the correct location. Further
investigation needed...

Alex

2018-06-25 21:20 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> 2018-06-25 18:47 GMT+02:00 Mark Hatle <mark.hatle@windriver.com>:
>> My question is "why is this a problem"?  (Why is debugging on for normal usage?)
>>
>> If you want to enable debugging with RPM, leaving the files is the right answer.
>>  Otherwise, as mentioned in the post it's REALLY hard to debug scriptlet failures.
>
> Not at all. I've done quite a bit of scriptlet failure debugging (in
> preparation for turning their failures into actual bitbake failures),
> and haven't had to look at stuff in /var/tmp once. I'm fine with
> deleting them.
>
> When debugging is enabled, rpm writes each line of the scriptles as it
> is being executed into the log, so you don't generally need to look at
> the whole scriptlet. And even if you do, it's written as plaintext
> into the beginning of the rpm file, so just look at it with 'less'.
>
>> As for the rootfs.py cleaning them up, it's simply not possible -- assuming they
>> end up in a shared tmp dir, as you wouldn't have any idea who created them..
>> this build, or another, or a system process....  (Now if they only install into
>> the image's /var/tmp, thats a completely different case -- but I still question
>> why debug is enabled at all.)
>
> Then we should write them to the rootfs /var/tmp and not the one on
> the host. Or even ${T} where the rest of rpm/dnf logs go. Then they
> don't need to be cleaned at all.
>
>> This suggests some (probably[*]) larger, upstreamable work done
>> in rpm itself, to be able to configure that behavior. I think
>> this is better than nothing, for now. Perhaps the bug report
>> shouldn't be closed, and this be merged as a workaround? (It
>> causes real issues, at least for images with lots of
>> pre/postinstalls.)
>
> Sorry but no. I do not want 'workarounds' as merging them removes all
> incentive for you to develop a proper fix.
>
>> Does anybody see value in what --rpmverbosity=debug brings, as
>> opposed to the default level of info? Would dropping that from
>> lib/oe/package_manager.py's RpmPM._invoke_dnf be a better
>> solution, or workaround?
>
> We used to have that configurable, but the default level of
> information is rather useless when things go wrong, and *especially*
> when scriptlets fail. So recently that has changed to always enable
> debug.
>
> Alex

