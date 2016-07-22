Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5E56067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 19:21:36 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id u186so44387182ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DuOOcAkceVYN8s2Hb1WDA3LLeFLBQRx7FXf5sxkFjRg=;
	b=dh5Y04ff/B9yykOr3ijetDkyQDhS00j4Op5SzstJOrG1Pb4lwVATps+7LU175+fgHK
	mJk6Vtp9nLP36yXQauMsumxUkqJRdrEAQ86Uj2J5y2IzM5qOVYeYTDAPFlUUjjf/Slt0
	YoWD2Xx7nsdoTeD75UelJRTNMurGmQVQB9iqd1anGnMcH7roVol7+OHpVLaoSZjQ1gOT
	pNvys5iu+KhHhUwJ0FQ3B15Glti7dTmUnGb+Bt2/LvwlhJBlPut9Hhe6yAslyTMeSLgf
	b4xbvLyk/I+Ghg87hci88KPjb4iUNbwGVwW6i7oIQI4JTOGcoQ+7FtIMwIRZF9hHMF5T
	YwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DuOOcAkceVYN8s2Hb1WDA3LLeFLBQRx7FXf5sxkFjRg=;
	b=jlGSoEoLrd7RFLMbQdOY0MgC3vpXeADZA01FVRP4umlG54N5ZS5azhBm3Equ/9HSsZ
	oY0W2stkQ1OutMJPw4w7QaQeHIiF3w/W44wX3xLFMTWXHBJoHeXy2SSqRkZD0DsXfGtS
	nv8BJ3DUxsO4ZRwlhg47qHFPXS6EWOhYn2RnOeYox9wNvrzeCT2rkzrOqJF4H0ErfB2F
	mfrQysI0SUSNH762EpgDwaEftR8FPIS7FVe6q1QB3Mei41sdWcjmAFViktecgNab1y8V
	LV2nvgiqxj2UVDK8wFaI5OMLncvDXYpxneonQtkBcF+ZsROl5HtjAfzqYgGFqeHxoVoM
	YNdA==
X-Gm-Message-State: ALyK8tKZqKUgE2Rn5nVDaOldE7KitKmEx2VjcoqyVPxv+brULMLJNfrc7eOpkQwyRUfo9o7pnzXCdLAlRa/ZbX69
X-Received: by 10.36.131.194 with SMTP id d185mr70925918ite.38.1469215297603; 
	Fri, 22 Jul 2016 12:21:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 22 Jul 2016 12:21:18 -0700 (PDT)
In-Reply-To: <1469211845-21125-1-git-send-email-Liam.Howlett@WindRiver.com>
References: <1469211845-21125-1-git-send-email-Liam.Howlett@WindRiver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jul 2016 20:21:18 +0100
Message-ID: <CAJTo0LbM1Jvcq59TPNHnU6NwOBwp2yfVEPE1KNMx2bw4YDfR-A@mail.gmail.com>
To: "Liam R. Howlett" <Liam.Howlett@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: Add --ssh-askpass support
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
X-List-Received-Date: Fri, 22 Jul 2016 19:21:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c049652e9b5ce05383e570c

--94eb2c049652e9b5ce05383e570c
Content-Type: text/plain; charset=UTF-8

On 22 July 2016 at 19:24, Liam R. Howlett <Liam.Howlett@windriver.com>
wrote:

> wget: Add --ssh-askpass support
>
> This adds the --ssh-askpass option which is disabled by default.
>
> --ssh-askpass will request the username and password for a given URL by
> executing the external program pointed to by the environment variable
> SSH_ASKPASS.  If the environment variable is not set, an error is
> returned.  If an error occurs requesting the username or password, wget
> will exit.
>
> Upstream-Status: Pending
>

That's a fairly big patch to be carrying and forward porting everytime they
release, have you sent this upstream?

Ross

--94eb2c049652e9b5ce05383e570c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 July 2016 at 19:24, Liam R. Howlett <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Liam.Howlett@windriver.com" target=3D"_blank">Liam.Howlett@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":57=
5" class=3D"a3s aXjCH m15613da1a29bc21b">wget: Add --ssh-askpass support<br=
>
<br>
This adds the --ssh-askpass option which is disabled by default.<br>
<br>
--ssh-askpass will request the username and password for a given URL by<br>
executing the external program pointed to by the environment variable<br>
SSH_ASKPASS.=C2=A0 If the environment variable is not set, an error is<br>
returned.=C2=A0 If an error occurs requesting the username or password, wge=
t<br>
will exit.<br>
<br>
Upstream-Status: Pending<br></div></blockquote></div><br>That&#39;s a fairl=
y big patch to be carrying and forward porting everytime they release, have=
 you sent this upstream?</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--94eb2c049652e9b5ce05383e570c--
