Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UX6sq-0005nn-Cx
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:30:08 +0200
Received: by mail-vb0-f43.google.com with SMTP id q13so216820vbe.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=rV0qp7izSd8ebppiAzaWVy9NYiihAtHY9rICUFVegwk=;
	b=YEL5gIHfaZ6c7s1P8NVlQeF//TrnOOHNCaNx26iTKpFESSewLcIY/cuJMOdrFkS++0
	mmxf58b8OrkwPun9Lo8UoYIR/gpKIU45CZDgBSCEJUcP0wUUCG3tEKv4ayZbNvoAB6To
	inTTC4/Da39XAlaT3rps1vQzuHQ34CGS5906PAp2aXeCDTL3wgWaYWEGeu7pofwJyL9t
	hpmfWHqflGBN2COMpOb3cTwG0yuDOKqo0EVo/BAsjzTcSCFN/VoYEkKCng905p++6/7c
	xzanpCAukG42q8PIod66LkNJ9eqDCzFq3nnRuOb0JLgzsPr+s4GR2iRQt8di3ISQxieZ
	oeHA==
X-Received: by 10.52.165.99 with SMTP id yx3mr15815682vdb.34.1367313124313;
	Tue, 30 Apr 2013 02:12:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 30 Apr 2013 02:11:44 -0700 (PDT)
In-Reply-To: <CAJTo0Lb-RNvd85JO6O0iTZSiuJ3HMe6=rpGdgqa4QF4Xv0SE_g@mail.gmail.com>
References: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb-RNvd85JO6O0iTZSiuJ3HMe6=rpGdgqa4QF4Xv0SE_g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Apr 2013 10:11:44 +0100
Message-ID: <CAJTo0La_jjN2COZzdcst99Cutm5uNER4Yqu8ayc3YXuHYAfJDw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQlqyY5eESbJXuxPUp7h+xxFp+zyVanN+szNCZvrazUojDNEck04Dy222p4n7eaSZc+dfKT/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: do not recommend udev-extraconf for udev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2013 09:30:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30 April 2013 10:09, Burton, Ross <ross.burton@intel.com> wrote:
> On 30 April 2013 08:31, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
>> * adding this extra functionality is an image- or distro-decision
>> * at least automount-rule/script breaks other automount solutions causin=
g
>>   misleading kernel messages as 'VFS: could not find a valid V7 on sda'
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> If you're going to do this, please also do udev at the same time.

Oh, and the images in oe-core need to be fixed to bring in
udev-extraconf as required.  The initramfs does already, but then we
need to have the debate on what other images should.  core-image-sato
certainly should depend on it, but what about core-image-minimal and
so on?

Ross


