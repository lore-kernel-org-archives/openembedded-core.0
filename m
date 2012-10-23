Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQgeX-00067J-FQ
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 17:44:25 +0200
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 23 Oct 2012 08:30:57 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so12126071oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 08:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=jSbbOAZFbZGYNn/qEpt/IP6Kk0I+BeZ1RawaF9fN5sQ=;
	b=oPuU2Ge3Yo0IQgUkdZxrSJvmNpPNFv1+5Vrfl3ztyucPJdqieUaQwyxgsUcMDqRPI6
	tC/emPGEhXypSoWa4LnkOMJamTuVSXHhpUI1y1/A3OwteikSFvKktzfsatm8M2wpUd/x
	ypFzB5Qw8hPc6YiLZpsptNNrx/obmA1I5SNH6N6ySMgZnvrw9YSQAQaEumQCfNZX1u1+
	Cm2/KF713TbcMPEVQrKLhH3N+rIEYo7B5X8U2U1Ry064A3/C8U6ARiSPOLl25qu4Q6YB
	pKAx5Wp69OEzYaPbVz9UWVleyzd1re0heaKge+mFxAsWMI9EoWztN8QEUxr8Q5n83spL
	dPGg==
Received: by 10.60.170.9 with SMTP id ai9mr11054810oec.36.1351006256249;
	Tue, 23 Oct 2012 08:30:56 -0700 (PDT)
Received: by 10.60.170.9 with SMTP id ai9mr11054805oec.36.1351006256163; Tue,
	23 Oct 2012 08:30:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Tue, 23 Oct 2012 08:30:35 -0700 (PDT)
In-Reply-To: <5086B713.30708@communistcode.co.uk>
References: <50869BDC.6050401@communistcode.co.uk>
	<CAJTo0LZHTGaVLnrYidOmLwvqB3Z+n9m5itr_4hA9krEPHihdsQ@mail.gmail.com>
	<5086B713.30708@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Oct 2012 16:30:35 +0100
Message-ID: <CAJTo0Lb0Fv=Hwhp88EUjurQO_Lnr319M-q_2Y6Js0fbzfO7Xfw@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQlLxWPRgPU8tF5PUMLPQuGhJezGU4X1Obuj9HeuR70lTlsd0rNB/Adlkf+0BylVTBfwhj/M+TT/4i5EBrefY2hHDiQT4Funpw2HaD4kUP76ZimoB7n0Nu1/RO8yVVpWBZSJXtfjoYPU3NiFv8/oeWSWbP/9akFJjWd7OmY6j7/cq2ycWdO7smFC00mTYstSdSgy65jG
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues building meta-toolchain, libxau
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
X-List-Received-Date: Tue, 23 Oct 2012 15:44:25 -0000
Content-Type: text/plain; charset=UTF-8

On 23 October 2012 16:26, Jack Mitchell <ml@communistcode.co.uk> wrote:
> No, it is not a clean build. However I got quite reckless with the -c
> cleansstate at one point which didn't seem to help.

cleansstate on libx11 / xtrans / libxau should clear out everything
that's got all confused.

Ross


