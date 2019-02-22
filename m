Return-Path: <george.mccollister@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id D2CCD6B067
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:23:00 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 32so2456162ota.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZUJr5OyddgcuXJX3RwnTLJ5Xr26ZrYD7a9JnwMdSmHE=;
	b=CEb4fL7s7E36wCafn1rFkx50Il4vBcyYar5rtW5HET4soZ/fAIwEbBHcganGy2OSA+
	+wsc5qUPwmGNplcXRZ4MOJdDt589IFuYQp1pr006YF9VGEOM39u7Y4yBiD5ZKk/B/HPk
	bU93itiuakQwSXpYRUf2TuGpVQvR0jN7T5Mz6HL52Cu6kuOD5tOxN8yqMIdL5hclfaNT
	umu6H8rMdMRkdQHI2GobTJ6lxWyoEMH4gyHeblTYNI/aSIsgb/9i3RErI8iB8BE0a7Zl
	bOcZ3IEdnpUCfGuzB3pVXs+5FcH44XgYzZALzDEfPhmLYgc+PANst9A+hn9dydfJfmbs
	lRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZUJr5OyddgcuXJX3RwnTLJ5Xr26ZrYD7a9JnwMdSmHE=;
	b=p5EE2YEDFEJ22467AOFBk+3vaUA2NCj+rwXvM1LbxYL2EGaA+EuVnyJL2t5iXZ9Pj7
	aK+iXn99+iuw3VFEUY/AkD+nhEIs1kZhHgaDb8i3+Sstkg8ENGnijh2VCCoBwss7jWTh
	h06/j75jXuTiTyCX8Ef9Yenkc3zLX0DSsXBe92RGxSOIKhZuTKJKquA8ZXuvUTj+2o00
	QeK6crcyGmlw8zkA53TyWqyeR/VuFRzpskeoVvONE3nJeaTrivMW2ZZHWIv/CcdVWbcg
	fHhuKa3KGOKKPRsxC0hCVMRdRQYl0PitVpdS/6yLVGcsYFwIFPENPEBezN9sglXdRT/f
	RvkA==
X-Gm-Message-State: AHQUAuZLVO3yHb0BejEOmj/QVv2OGwzHOKGkEaYTNbec12mi8X+2bYGO
	ZgdNMM3TgaUqJUO0AN9ctRtUpdneU8A1MxBrOg==
X-Google-Smtp-Source: AHgI3Ibhly2gZNePL0wS9xAOYpigo/ZLfSxnBbysl1nLeO3QFKki+o8XG+LFZP2gs35KagYgGHtCwB36LG5d6XqKgnw=
X-Received: by 2002:a9d:630f:: with SMTP id q15mr3206383otk.187.1550856181629; 
	Fri, 22 Feb 2019 09:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20190222165450.30773-1-george.mccollister@gmail.com>
	<CANNYZj-Fx7W5MKb8hp9F5mPC05fhxq1S56_F9-PDr38yK1ofVw@mail.gmail.com>
	<CAFSKS=M3WckCq3mwaMVWUoo6HaBOR1tBbMyYrg5nJw6=E_0XZQ@mail.gmail.com>
	<CANNYZj-dz6xKtuuOTVAKz-j-+w_qeQXrC_5PTG8cxNeJFs4ZDg@mail.gmail.com>
In-Reply-To: <CANNYZj-dz6xKtuuOTVAKz-j-+w_qeQXrC_5PTG8cxNeJFs4ZDg@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Fri, 22 Feb 2019 11:22:49 -0600
Message-ID: <CAFSKS=O3B17J_5oOD6_xhKU7_obNcD4rVm3-zqP4tWQjEroiww@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix CVE-2019-6454
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
X-List-Received-Date: Fri, 22 Feb 2019 17:23:01 -0000
Content-Type: text/plain; charset="UTF-8"

I missed that some how.

Thanks for correcting me.
-George

On Fri, Feb 22, 2019 at 11:18 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 22 Feb 2019 at 18:13, George McCollister
> <george.mccollister@gmail.com> wrote:
> >
> > I believe this was discussed before and the recommendation was to wait
> > until 241 to be release. In any case I currently have no interest in
> > upgrading it. My main motivation is to patch this CVE in sumo but
> > maintainers seem to want it in master first (even though different
> > version of the patches are required).
>
> 241 has been released:
> https://github.com/systemd/systemd/releases
>
> It's fine if you don't want to do the upgrade, just wanted to correct
> that point.
>
> Alex

