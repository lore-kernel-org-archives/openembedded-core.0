Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 65CE0772CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 14:37:02 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n21so58146521qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 06:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Esdc7Gh2TAdo4+Gg/c8OmNHDZOnRduLkzw4NSNdza4M=;
	b=YhIDBqMHMy0pegdIoXYFgH8yGu8PwCB+4Z6/7ETJWpoJuTmY39g3raKeIV4BU7GrLt
	Wr5dHgm9NyQ34DB19wzhU1VNtgzeEZyxzUFvIEq4dyNTDvbcIpfaFcGlD1+QzoWC4OXw
	At2BCAn0AyMqcnDqRYg4ggc8K0JiEEUmkDjukKunb5OdKR4sy2cRSxjt1Q6SM+VZU5bI
	NKz/oAPA90MoAhoGAaFPEtzTkc/V8wP/jbYI+Y1zSfyS8iA2fiPdAawCKSSuKlLfHcV1
	J5TYEx7+QWbcW2XL7YRTTfQIUXB5Qf4B8Qzipqd0CZCeV5Y/psAlwVMzNBA6e5DicU8i
	g5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Esdc7Gh2TAdo4+Gg/c8OmNHDZOnRduLkzw4NSNdza4M=;
	b=nxtKKxMlszxuAXwvZ21LLyK4AbOksMDff2jut2omO5HYP49/LUkYOQLVwZ8zjSHwUD
	0dJSID0C4CN3bn0P88Fd0D70/QU5/NwNw2jebxI8y9imfXZzsmeghbJrRVQ/i6l3wQhh
	NqRgqVcX7mNkiESlSxHIQrodfugiVLAU3HfVL21oesVQBkGrNb9FGjPk+0Owqk5vQGav
	z3ngdtM5SObgRKpIBTETc/npBnDdgnPl/0QlmYqDAOrQ19It3U5v2zGwjysjnWCcsrj/
	Ks5JQ2Ug9JDPRNRviLTz2o+MJ9bkBXorgQAKE6tLTbI3s4lTZSmLjDHMKLJPKR9qfV7V
	uJdw==
X-Gm-Message-State: AIkVDXIf89E63yTC+g8cGCBftNaY5pvDn8J9hA2o0z0XrRpxSFu0ohPZqKyn0obQyhBvzUbfmYbR2RBHg9zZYw==
X-Received: by 10.55.195.141 with SMTP id r13mr1390158qkl.131.1481812624311;
	Thu, 15 Dec 2016 06:37:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.46.162 with HTTP; Thu, 15 Dec 2016 06:37:03 -0800 (PST)
In-Reply-To: <CAJTo0LYb7j4XYBjekHr8xNP5UpmRJKkVCof9aubiRO=XoXC=-w@mail.gmail.com>
References: <CAHZ0fbGcJPSjagwjxu08SxbaCAr50ucZ7WL3s-cMG2v4JaoNdg@mail.gmail.com>
	<CAJTo0LbB5_PkVd-XBH7ESUtiGvTi7ziqLjRr9FXjLp7zAVpvqw@mail.gmail.com>
	<CAHZ0fbGUf4naEmiEvTPuEMT2LgRYKf+m70-rqon7ZReVrp9a3g@mail.gmail.com>
	<20161215135317.GA11254@openSUSE-i7.site>
	<CAJTo0LYb7j4XYBjekHr8xNP5UpmRJKkVCof9aubiRO=XoXC=-w@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 15 Dec 2016 09:37:03 -0500
Message-ID: <CAHUNapTqyjiD8uyif+CJVDxydub4EkyDKtV6K5jn_v-pYa6djQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-intel] [PATCH 2/2] gstreamer1.0-vaapi: Import from meta-intel
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
X-List-Received-Date: Thu, 15 Dec 2016 14:37:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 15, 2016 at 8:55 AM, Burton, Ross <ross.burton@intel.com> wrote:
> When gst-vaapi moved to oe-core it also renamed to match the convention in
> there.  I guess we should add a PROVIDES for the old name to ensure it
> replaces the old version.  Can you test that this works for you?


Okay, testing now...

