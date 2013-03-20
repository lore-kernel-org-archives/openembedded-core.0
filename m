Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UIKpK-0005LK-5B
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 16:21:22 +0100
Received: by mail-ob0-f170.google.com with SMTP id wc20so1734892obb.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=66Y702DkgOvlxFqr8rvWsGEZkNSD+7WVm+qQjdKexqc=;
	b=qldl8hEWkKJO9bzAkSIEMnlvMCTVnVRBo/qMrpw4axkA3TAHrWyf3ZgBr6rXosZr4k
	ON97/mBS9VdgtzpujPR/jmF2c1y9pkBEWmRnf5GLryvGbeg5t6v+uBgwk+W+q56jjeIx
	W/lLzUZ9zmUxbLPVboYpgQnkr3C4GKn8LF5qGr76vrxAYs7vY/1akPInR8vuiMN+nuuE
	kLKSp/QDemEnPuEtVi7+HVnbp7VQFjvUdegs1kcj4b8rIlko70HU6+uyC/edjcV0B9yK
	hzCAOyBAtBDdKRanHFWa8ObF+7xRt5IrzwaVMWt2DAX3y+hYlpPD4w7kM3W3zw67f6QE
	Ad5w==
MIME-Version: 1.0
X-Received: by 10.182.39.69 with SMTP id n5mr4374909obk.72.1363791866626; Wed,
	20 Mar 2013 08:04:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Wed, 20 Mar 2013 08:04:26 -0700 (PDT)
In-Reply-To: <CAJTo0LZbNPNV1vbzWyfd9RU7Tz2y0nfqbeB6Rrns6RJPhQtpfg@mail.gmail.com>
References: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
	<1363730053-7719-3-git-send-email-eu@felipetonello.com>
	<CAP9ODKpRRTpX_Ksr4ySSatTCRV4e0f8PREJnP7E8gF02e6Rmiw@mail.gmail.com>
	<CAJTo0LZbNPNV1vbzWyfd9RU7Tz2y0nfqbeB6Rrns6RJPhQtpfg@mail.gmail.com>
Date: Wed, 20 Mar 2013 12:04:26 -0300
X-Google-Sender-Auth: B-OsX9i9qFS5NYyVFuSj5ICV7aU
Message-ID: <CAP9ODKr6LLLHZnao_nS3OsMSk9M1ed+Na-yD5kp7545qghv41Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] qt-mobility: Add pulseaudio dependency if DISTRO_FEATURES has pulseaudio
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
X-List-Received-Date: Wed, 20 Mar 2013 15:21:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 20, 2013 at 11:56 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 March 2013 14:04, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Is it possible to explicitly enable/disable pulseaudio support?
>
> Isn't PA one of those "all or nothing" options?  If your system is
> using PA then you want support for it everywhere, if it's not then you
> don't want it present at all.

Yes but if we don't explicitly disable/enable it we risk to do a host
contamination (for example building for same host arch)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


