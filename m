Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 15F41600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 20:26:50 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id o67so477711815iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 12:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0K8+T8iVBGW+tRG8loyKMmUsbDIVnfwk5xOGkZDUe+4=;
	b=vcXGK1IsWncpIG+k/U1C42cFm3+Jwdt8Zb8XXINaUFrsklPe7It/rwPj08/13PZC/W
	Rd58UKaUOB/I/KxSNF9PTeOopLvyOx24c/F45aTvj7VJvPi32zixDCvg+jtTUX+/9OMG
	wAt7HAPAIv1fJXMcOUL5xeNxNKUbAoNI2aDNWFmtixdgqUewjkV38G8K3pzzyKMT+eYu
	JNKNJiOK4AbBzVlwix+UjfMpYF9Yn4ToncpUelpT4dl5SCqU+XGI6WbUsRmADr2v/KT0
	0LaCDFU8COMKjaKkOjT+O9aCCjQKVbb8SmbpVm5DLysHqRvlPxKuNbEkaZGqqIdGaQN8
	MnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0K8+T8iVBGW+tRG8loyKMmUsbDIVnfwk5xOGkZDUe+4=;
	b=mXwjL7zSgwkPUiqGz8POQVCrC9pXXRjS72LJwHdIb3ynXGdx/1JKbZ6NhRtt3GQWE3
	bak+nnebjQQYjbDSqzl0rOyvGC7yD92/G6PaVFmzoAQJEKPAuw2Pbo0PTdqVMwMLtKJA
	DgNKcS3kVHgilkoH1WKxcAEG56fG4npqa3Cra2tpANbUpyzG79yg8hG/scvUIUNaHf+a
	6Nuji83U2MyyjffGHOFWquxffi50heWPseZo2k3Lp8A8ozl8IXf607ttVd52RXKP8zvN
	KKjaPB+iyo8tRkrXD3j/zJO68Zh1gw7HAOkXNMU2EpUMuMgTfmpolirXfJH9EwSfnXJL
	Tivw==
X-Gm-Message-State: ALoCoQnmLl4dZZP0AlAyxnSceR5/pC1UN935yUZ1IG5BOO7eL8N9SFxJRn7OWkEppk6dGl7g6spjhIOVn9WL+9/u+eMYH9YgXHQSV8oJa43RlnwQO+7ZwK4=
X-Received: by 10.107.3.154 with SMTP id e26mr80776521ioi.99.1452025611473;
	Tue, 05 Jan 2016 12:26:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 12:26:32 -0800 (PST)
In-Reply-To: <CABcZAN=S55vPVZYA21tZvgBxSaCRoCOBfGzjdjvX7kqHgAiaMQ@mail.gmail.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<CABcZAN=S55vPVZYA21tZvgBxSaCRoCOBfGzjdjvX7kqHgAiaMQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 20:26:32 +0000
Message-ID: <CAJTo0LZ-=ZAg6PDUshE=ytJ-c98Wdv=ggOPJSd0SyfgAU6uHVw@mail.gmail.com>
To: Christopher Larson <chris_larson@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Misc improvements 2 from Mentor
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
X-List-Received-Date: Tue, 05 Jan 2016 20:26:51 -0000
Content-Type: multipart/alternative; boundary=001a113ec10ac6ef1505289c0e52

--001a113ec10ac6ef1505289c0e52
Content-Type: text/plain; charset=UTF-8

On 5 January 2016 at 19:08, Christopher Larson <chris_larson@mentor.com>
wrote:

> Any objections to this series?
>

Slipped through the net, thanks for the ping.  They look good to me, in mut
now.

Ross

--001a113ec10ac6ef1505289c0e52
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 January 2016 at 19:08, Christopher Larson <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:chris_larson@mentor.com" target=3D"_blank">chris_larson@mentor.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"g=
mail_extra">Any objections to this series?<span class=3D"HOEnZb"><font colo=
r=3D"#888888"><br></font></span></div></blockquote></div><br>Slipped throug=
h the net, thanks for the ping.=C2=A0 They look good to me, in mut now.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a113ec10ac6ef1505289c0e52--
