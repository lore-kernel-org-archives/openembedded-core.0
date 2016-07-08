Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A5F9C60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 14:07:43 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n132so9726628qka.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wREKC6cWLmRuVxOWW9uCUHUHDVdtnVpfde2vcm4yXDo=;
	b=VXb5fjjlpum3QonANT9kC6IZ8AnjI9/SZkEEb3BJ6+C2RPmXLkUIamYepCxTPIT1IB
	iWLtGBwrHlO4NpJHXjnsQAiOb1M2Wz7jS3fwff199uba9Rrmiv+Gehv6+g9ftbs0JD8+
	VuIm/qBrkaJtkvnSZJLD5JFAcAWrXi+jykfsao1JyyS2tcwVOu7rLds4D1p1MHUo1KbN
	nx4xmZHxrEWc775L+oYicfNEWL0MkO3VZbiHAeZdz8THBgp8WvtDemiQJTG/Bn6LPpXj
	4CGktZPHCjmyb5D4rwGPsgPYRp4qz86k5YvyYfWDfluE4B3qjSw9RCR9IicrPYyanEIu
	oK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wREKC6cWLmRuVxOWW9uCUHUHDVdtnVpfde2vcm4yXDo=;
	b=dPdFI+H2+F8GSzRKYVtYZqngEQJJS6rcrWeXwcRpurovVlBvHrSKeoOgRNRgJzejEl
	ndl0hqH1Xncm5SbPvP/mx0fmlbzw76WiTQFgj4aV4zWFy1eMQZNtuz7k8n/4C/jUt8Vm
	orU0oLITTrKx7Ptu+OaboonSfi7eQpI/s/LOHvyQYUVmLG0od5lbQWp3SKI8/op4keEq
	svK6WrPxmGbG7VEZtqO6/01YOmu8TABHYW3XpziknHNCDebmt1OynKDwdlv1sEldqcwu
	Kms+Al0NuiWvYLv7Xh2Nr0V4VG4jtKYYy7lzsnJC6fEEvn5pNKh7BmJuSmw6Acrtg6fy
	tNTA==
X-Gm-Message-State: ALyK8tJyfzEPUmbKJv99OCqQRmDjQBWI+vMqw/oZGhXlj5OCbLYlQq9q/YEIpWFsm//Ee2IGXeUYLus66NxHcA==
X-Received: by 10.55.187.4 with SMTP id l4mr7932771qkf.152.1467986863922; Fri,
	08 Jul 2016 07:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 8 Jul 2016 07:07:14 -0700 (PDT)
In-Reply-To: <cee6d405-3fdf-157b-967b-91022d5e9b9c@linux.intel.com>
References: <cover.1467914773.git.raj.khem@gmail.com>
	<cee6d405-3fdf-157b-967b-91022d5e9b9c@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jul 2016 07:07:14 -0700
Message-ID: <CAMKF1sp+XRQ5bUd-8387q5PcWuQRspRj+UJS9LkuGGhr1WPw6w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] musl/glibc/binutils updates
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
X-List-Received-Date: Fri, 08 Jul 2016 14:07:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 8, 2016 at 6:50 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 07/07/2016 09:08 PM, Khem Raj wrote:
>>
>> Fix gcc5 hang in SDK with -mmusl
>> Update musl to 1.1.15 release
>> Update binutils to 2.26.1
>> Update glibc to latest on 2.24 freeze tree
>
>
> What about uclibc? It should be updated as well.

I do not test it regularly. If there are users who want it we can continue

>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

