Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEEA600EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 17:06:55 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b84so1699155wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wxSPD+MTJm3PTQse8FZdqzpTQsBH0NHfSXstOEKvc2w=;
	b=Nn/uMN3aS3WCYXtsuwXEU7mos7TqcLXNKPBveMNasSwjqEukP3shkFFXkhbt02YuMh
	YWdK1x4/rbvynLSfuM27hmarqO/Ug8QXorfu0EJP1XTtN1a8sGptqY08Z7so0yJrlqc7
	ZUiYQt8uuqDrzjGJcdV7fvLCrA24wmqs6/o2qebpKMB9761A2PNonvwXSO5NHJ5qa2Yc
	KxeobZH0kz4dTJw/YjVSdctHw8Bvm45sDVgV35G4qwFcCV/WKaegdNoocPiJqQe+oR9j
	7KBm08ic0CKLWC4C3Gzo5m/Xeqm4O+RfwPWtaYHiKDUVkTnPMwGIE4B/l0YF8kmXAoCH
	a84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wxSPD+MTJm3PTQse8FZdqzpTQsBH0NHfSXstOEKvc2w=;
	b=Wbk5lD67sohZYsJticsss2Zg8JL9OQP90PyHF97ediLvjG9bm2TBfnaEKGxsl03Art
	Kpi+EjA1xlpJRq8VUdg4FG4iLP5i+lIOoolnD+Z7/FsCEqlmCBSI7xADcur8TontWok/
	qGAkLHgk1uCDQxbaPOH2TUBjXnqpRwrzjJacnKxVaN5OafcuWFViECtqk0N8LEbtHIyB
	UMlW6beTxycsHWkBA5XA6gywP7EXP0R9T7kG4nPHVnWL8PQuSt7XfHOsP6ukXJUOPg+9
	m2jGZGqU+No1cPkgm4ax6PU5mcvUqUzbKbjn+drX6n5zwXXONP8rB6vCf26qB8C0JMYx
	x6qg==
X-Gm-Message-State: AODbwcCkzWCX3DTIJ+a6D/wXK4mdY6NLlsGCj5KWRdkUpBS69wEwMmG/
	Q5om1yr9ji/lFzbB1kHlefUKoHo/eA==
X-Received: by 10.80.144.118 with SMTP id z51mr17566400edz.143.1495472816924; 
	Mon, 22 May 2017 10:06:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 22 May 2017 10:06:26 -0700 (PDT)
In-Reply-To: <CADkTA4M-3HipxJL7GnE9FJkK1hKJQ9EOjJpvUpyom8WNgbcGnw@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-11-raj.khem@gmail.com>
	<CADkTA4M-3HipxJL7GnE9FJkK1hKJQ9EOjJpvUpyom8WNgbcGnw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 May 2017 10:06:26 -0700
Message-ID: <CAMKF1sqBtBGzB_o_eM5SYhG+mS=kNqspYQDEu4dOe=FT70HSqA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/15] linux-yocto: Enable drm by default
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
X-List-Received-Date: Mon, 22 May 2017 17:06:56 -0000
Content-Type: text/plain; charset="UTF-8"

>> +SRC_URI += "file://drm.cfg"
>
>
>
> If anything gets added to the default configurations, they need to go into
> the kernel-cache
> and then be included by the relevant kernel types there.
>
> If you want, I can take care of switching things to that format.
>

yes please.

