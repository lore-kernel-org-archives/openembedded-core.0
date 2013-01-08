Received: from mail-ob0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tsa9v-0008QL-Os
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 15:28:08 +0100
Received: by mail-ob0-f178.google.com with SMTP id eh20so383332obb.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 06:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=JKw9JKHBRumh1pOPt4czsumnTPCny09UxLCcAgwvgvw=;
	b=CCcq8PExyCRiLrJdvlWKNUB9iBTETiPkybjL6IKPIzYXv35NuM+MFRpT7yKUFKz/hQ
	HSJDmpb6HckKoz5Eq9Mis/v3v/gWBFAcmWY3j2gl+vzilAXdcByHnoZyZh0zI4Zv8zzl
	JLpjzybz0mim1M36CdZ5KF38vg50FUp/jDqabALCnwlBdsvt0x9YVTrm+zjh+leyJG8Z
	KWCEgA5xlWur69jWJdhFOpYGBUpZlL+aX8jJmYCBGxKXe0Ge87g9DYawVr2FBD3ZS/lq
	dC7BSgRy1T6fNHKR4CpRPsOK3xriCTWI+4MfR6FcvIVUbWPLAaKBpv2Z9nl6r1Za3IH7
	1X5w==
MIME-Version: 1.0
Received: by 10.182.212.70 with SMTP id ni6mr45856434obc.44.1357654375934;
	Tue, 08 Jan 2013 06:12:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Tue, 8 Jan 2013 06:12:55 -0800 (PST)
In-Reply-To: <1357643185-495-1-git-send-email-otavio@ossystems.com.br>
References: <1357643185-495-1-git-send-email-otavio@ossystems.com.br>
Date: Tue, 8 Jan 2013 12:12:55 -0200
X-Google-Sender-Auth: faQCEnQLy3FocYtd2eKgKtVDkug
Message-ID: <CAP9ODKp2-870ZXHg4tjyrVM++-+MzwdkWwhjt5V+iS2V_y3MWg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] libnl: Update to 3.2.17
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
X-List-Received-Date: Tue, 08 Jan 2013 14:28:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 8, 2013 at 9:06 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> * fix-build-using-flex.patch: removed, it was a backported fix from
>   3.2.17;
>
> * fix-callback-segfault.patch: added; it is a backport from 3.2.18 in
>   development;
>
> * add-missing-header.patch: added to fix build with old kernel headers.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Please ignore this patch as upstream has release 3.2.18 with thouse
fixes. I am going to send a new patch very soon.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


