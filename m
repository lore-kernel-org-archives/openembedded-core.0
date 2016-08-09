Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 60857771F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 11:54:17 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id f6so11621146ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Er1WYSdrW0htGWoE2RIjMfVudvL81SjmsYlqcN3XcHs=;
	b=Pofczxo2V8MnNiF725UZaKxo72Z3etRR1tfNjzyTuZPNrmuqAvhqP3QSiW9nrr0138
	EA51+vtYSbqGAOzByTX6kqiI+fOsOE0S3jh/3/iYG3Vcj6LAIKMhbFEy4r1UkMWXSehd
	iop8vj68EW2vVZ3tWKvkK5GxVLIV7yCi8tcgKV+ZRr6LQwxjxF0ab2gMvcCrfsP+71dG
	3IwAgu4hMAu44DHyncEzhTYDQeBhKMRpACKf5YYxaL65rzrPrnmcv35lMloL7tdoPKsD
	MNjfVlhkGgjS0wDGISVRHtNXf4cUbf+qJmmzemjfXxx8CfH+RZ51kPuJcFutluPEa9fN
	QTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Er1WYSdrW0htGWoE2RIjMfVudvL81SjmsYlqcN3XcHs=;
	b=SQZd4u9WhCGKwrTjmKY8lWSCNg+oBHtS6+zFJt0HodSgOYbkwq5g4CyAmGM87pnJKO
	3iSi01tnCUcYqgGqWGXCW5QCOJa8oA25xg+gEqYk11S0Dlf8c7IyLlvtc/MM2Hlg6WOV
	xL3rh1tHbOT5j/vvrpO923Mnh0BDnGbXmEG/FESsjG9uMJ6nYBX7CugftcrILbzVyFBj
	qMWcVw6lsIaDxQt3M5Gd1iGerBQ4tBfKtDerSSdz33P0wUNiZRdyWfYs3+e2s2sfN/uJ
	GuzxQU23vl3YIimKAXPdHe7iX2qbdVb/zQiX2nPOGJFK4H00Bp1MdzOQsuKRsBAR/IOu
	av5A==
X-Gm-Message-State: AEkoousHbshs+fVpwSahVMmJkQNQLiRJqmSp6I/IVrAR7mEzZ3Aili1784GR8dGgj/dHtgSZYCyV+ddnR4mk56hp
X-Received: by 10.36.19.75 with SMTP id 72mr23143296itz.83.1470743658163; Tue,
	09 Aug 2016 04:54:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 9 Aug 2016 04:53:57 -0700 (PDT)
In-Reply-To: <1470740681-54905-1-git-send-email-sona.sarmadi@enea.com>
References: <1470740681-54905-1-git-send-email-sona.sarmadi@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Aug 2016 12:53:57 +0100
Message-ID: <CAJTo0LZcNHJGMhGivzw5VX0T91NvkUuMbd5V3tND_CW2mjC7dg@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][krogoth] sudo: CVE-2015-8239
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
X-List-Received-Date: Tue, 09 Aug 2016 11:54:19 -0000
Content-Type: multipart/alternative; boundary=001a1145180a4d092b0539a2318a

--001a1145180a4d092b0539a2318a
Content-Type: text/plain; charset=UTF-8

On 9 August 2016 at 12:04, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> Fixes race condition when checking digests in sudoers.
>
> Reference:
> http://seclists.org/oss-sec/2015/q4/327
>
> Reference to upstream fixes:
> https://www.sudo.ws/repos/sudo/raw-rev/397722cdd7ec
> https://www.sudo.ws/repos/sudo/raw-rev/0cd3cc8fa195
>

Is this applicable to master too, and should be backport it jethro?

Ross

--001a1145180a4d092b0539a2318a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 August 2016 at 12:04, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":21" class=3D"a=
3s aXjCH m1566f0896c7a20b9">Fixes race condition when checking digests in s=
udoers.<br>
<br>
Reference:<br>
<a href=3D"http://seclists.org/oss-sec/2015/q4/327" rel=3D"noreferrer" targ=
et=3D"_blank">http://seclists.org/oss-sec/<wbr>2015/q4/327</a><br>
<br>
Reference to upstream fixes:<br>
<a href=3D"https://www.sudo.ws/repos/sudo/raw-rev/397722cdd7ec" rel=3D"nore=
ferrer" target=3D"_blank">https://www.sudo.ws/repos/<wbr>sudo/raw-rev/39772=
2cdd7ec</a><br>
<a href=3D"https://www.sudo.ws/repos/sudo/raw-rev/0cd3cc8fa195" rel=3D"nore=
ferrer" target=3D"_blank">https://www.sudo.ws/repos/<wbr>sudo/raw-rev/0cd3c=
c8fa195</a></div></blockquote></div><br>Is this applicable to master too, a=
nd should be backport it jethro?</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a1145180a4d092b0539a2318a--
