Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQal7-0001Qn-3d
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 11:26:49 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 23 Oct 2012 02:13:21 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so10827656obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 02:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=ZGL4XX+hbVgjM0yuGrBgjwgLhd3SqcJiH8SiLizBHZk=;
	b=Agl13Ug52mu6IzXy5ZHWQk4r9An29XNNIm6pRxebLR6tjdAbJawI2ehl+Qu091nkxz
	YgT9TYRIAzZtng2erPN0yyF6cE6yVOFNgKLdtHOele9JGpIcuNCHafYcQCDj1Ch24b/q
	jFzZ0CS+xakIDA3YoLX+tSX20Fei9ZBUg3QFpS0cyHfjWnYj025BSR2K3Bp70SYaaNRc
	usVU3Cz/TnPI4+eFbLyyR8KuNLeQux5ZsgdWJFPmCEKe/vnmKpvIDrilx3uPfnz3TRtj
	67kTCg/iaLuLH93H13Gzd0L4DAg3bMhKuZopjWrLVHr4P/e2xb4wTp0x68cCmPRvMH0g
	qMnQ==
Received: by 10.60.24.4 with SMTP id q4mr77782oef.1.1350983600470;
	Tue, 23 Oct 2012 02:13:20 -0700 (PDT)
Received: by 10.60.24.4 with SMTP id q4mr77779oef.1.1350983600393; Tue, 23 Oct
	2012 02:13:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Tue, 23 Oct 2012 02:12:59 -0700 (PDT)
In-Reply-To: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
References: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Oct 2012 10:12:59 +0100
Message-ID: <CAJTo0Laj9kyJKVsmKi0tCN7uWsdP=Jj0Ouz7+YEwgWSAF3pLaQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQmX6fUaobHX59asi/URpI4J2rDGYD00Opbw3yUg8qpa+mDtaAVHITMvPPsZgUnSkId0t2RqiwgNzAXe17eidnwUCIC6cfgXkeFQ2tXunuddnlLg4ZflabZxMSEkM72wJEfqwMggeo83dYyfYhGpUErVLmQ4RgvqAJizAwoFA2hT6hlBtKOPnauwsRIlaMSVd0j/7KbU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: icon-themes fixes
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
X-List-Received-Date: Tue, 23 Oct 2012 09:26:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 October 2012 08:04, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> The following changes since commit 06d27cf0fbcc4004e6f456880eca49893c9290=
bf:
>
>   xorg: remove XF86 BigFont extension (2012-10-22 14:57:26 +0100)
>
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/oe-core.git icon-themes
>
> Andreas M=C3=BCller (3):
>       gnome-icon-theme: fix icon mapping
>       gnome-icon-theme: remove unused configure variable
>       sato-icon-theme: fix build

Looks good.

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


