Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 90B8660034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 12:10:00 +0000 (UTC)
Received: by qkbr67 with SMTP id r67so10214219qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 04:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vOXQNI7ZRvQzTrJl7f+W4oOl8XlrhTJi71pB5aXoT+Y=;
	b=yaAEYjJBRgsMw64C3XavIfVZk1mqjxZtb5wFVJykI5CFFJ0jtHhL+hQKFCM52epnPs
	+mEstFKMDvWL3FvVHt8fa2dB8unIYHqzcF2bJAAxsQAQkXezzT7NnPKZspe3MoDSbJCv
	YdcCRlZg/oHYVPHPpQjv5AXpSHrlyRlU9NsruZiD4pdTFJDhbyqm6IG1DOdqNm+9SKHi
	ZRxEdXuR5IeNJ9OGY1JO1St9kSW1qNBxbxy9G3yO1HIVx+n9Xt/b8y3rl27+aCHOdlJR
	K/BFAhxkh/eWvch3w4m+jd705WP7DeQ4ro7bZjgEcGltfaIrSLEDkTyLW1mTDiidmBe4
	BLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vOXQNI7ZRvQzTrJl7f+W4oOl8XlrhTJi71pB5aXoT+Y=;
	b=UefI1/C4fac4miyjlKhWDqJ3vvrdowm8v3QFMVtUfKV/j2+OsGlQZ3ui3pDVsgpPNL
	6mqFSO+Bcd+ljMkZql0L/GhSoM+tlpbJikEwv88obPrVt/SosQy3jAWWrTqTs6DQmFU4
	atG+mECWfbI+ccY8in8kB1uo4fQ3f0DKbGYcE90vLVwDaJh9imdwCPMUZfE+/k1Pg4+2
	GYSmpScQ9/fEEIaHDZKvXgVXqL2ftbfn6QzxasZS9qyJKhxxV7wi/jR1eoO0dV+4upi+
	9eW5ENliMyzdiOco+Od2IrwHRVQYXSFCAoCDDB5ubUNasHsZ9f+rDsK6TVeFuJhMipsL
	oAzw==
X-Gm-Message-State: ALoCoQnBQmOZASnsn7QYuPshlhPERULUxRxCoCKkRZ+PjTxJnlqKVMamSaDNgBeYwZThhCTYKPGC
X-Received: by 10.55.78.143 with SMTP id c137mr28787886qkb.72.1446466200850;
	Mon, 02 Nov 2015 04:10:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 2 Nov 2015 04:09:41 -0800 (PST)
In-Reply-To: <CAD1M061GOgOmOj2MPduyOZYzEhREhxhiDKLFYzmjVHAcFZfokQ@mail.gmail.com>
References: <1445634201-13944-1-git-send-email-psidhu@gateworks.com>
	<562E0FB3.10001@linux.intel.com>
	<2756512.QMAWZ5dkze@peggleto-mobl.ger.corp.intel.com>
	<CAD1M061GOgOmOj2MPduyOZYzEhREhxhiDKLFYzmjVHAcFZfokQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Nov 2015 12:09:41 +0000
Message-ID: <CAJTo0LafTRw+H1ViUCjKcB0NjMzUvjKqr=PnNiv+U6BGGHyLHQ@mail.gmail.com>
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] webkitgtk: Add upstream patch to fix build problem
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
X-List-Received-Date: Mon, 02 Nov 2015 12:10:01 -0000
Content-Type: multipart/alternative; boundary=001a114a8f6814e99205238da813

--001a114a8f6814e99205238da813
Content-Type: text/plain; charset=UTF-8

Hi,

On 30 October 2015 at 15:46, Pushpal Sidhu <psidhu@gateworks.com> wrote:

> Just wondering what the status was for this patch getting accepted. I
> haven't heard anything from you in a few days now.
>

It's queued in in my staging branch for when master re-opens after the 2.0
release is made.

Ross

--001a114a8f6814e99205238da813
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 30 October 2015 at 15:46, Pushpal Si=
dhu <span dir=3D"ltr">&lt;<a href=3D"mailto:psidhu@gateworks.com" target=3D=
"_blank">psidhu@gateworks.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div id=3D":3m" class=3D"a3s" style=3D"overflow:hidden">Just won=
dering what the status was for this patch getting accepted. I<br>
haven&#39;t heard anything from you in a few days now.<br></div></blockquot=
e></div><br>It&#39;s queued in in my staging branch for when master re-open=
s after the 2.0 release is made.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a114a8f6814e99205238da813--
