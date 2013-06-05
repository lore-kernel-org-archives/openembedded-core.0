Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 774176A598
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 16:32:58 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id fb19so2902881obc.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 09:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=deBckLQ5LI/1ZUQVD8SsAZDbjNnNMlMM16Bq8FGx4Hs=;
	b=YwsCO2bc2XjrPKR97FTUwiLj4hSQ/uQ0nUsqd7uYJg8vZ9yZnPD4v/UaRXt1SfzQ/s
	CUm6b3Ue2xKEMhChzLuHwgJwUDglqE1eOE2dw1gFMe3ysrbT1zX2IohsSlp3vkQ+dTfj
	QSq/Zq8kzDUwARiR6+acCUsQr1hfV0/uu62PCTiKINSrTXtxaJnGoaTjhmkj9rOmdazK
	mS9W01Dc/uWqXz2OR3l6BWkaRBiUBcxZKNV1iLbhgf6djTXCRfeCImlIk+RHZEWZ5Lev
	qsJuGE6Q0V2YMjwNpU6En8OV+Qp/dUrEtO3Z02AIfQRLTTDyGNjiJXvYU9A59V0CmIY5
	OcfA==
X-Received: by 10.60.141.231 with SMTP id rr7mr15053782oeb.77.1370449978788;
	Wed, 05 Jun 2013 09:32:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Wed, 5 Jun 2013 09:32:38 -0700 (PDT)
In-Reply-To: <51AF67B8.20502@linux.intel.com>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
	<51AF67B8.20502@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 5 Jun 2013 18:32:38 +0200
Message-ID: <CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkO3Yewwack8czvMEXoqm5HviXWuNFySbYM4VPDFItn/NUuFMd3ZazpSXGVQrS3aJbXw7Jr
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH dylan, master] Fix meta-toolchain-qte SDK build for x11-less DISTRO
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
X-List-Received-Date: Wed, 05 Jun 2013 16:32:59 -0000
Content-Type: multipart/alternative; boundary=047d7b339a3f2c746d04de6ac0dc

--047d7b339a3f2c746d04de6ac0dc
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold <sgw@linux.intel.com> wrote:

> You could just directly put the nativesdk-libx11 in place of the variable,
> no need to have the variable there.
>

yes, that's what I had initially, but found it was less easy to read...
with X11DEPENDS it's more 'obvious' that there is something special.. that
said, i can make the change if that's really needed.

--047d7b339a3f2c746d04de6ac0dc
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold <span dir="ltr">&lt;<a href="mailto:sgw@linux.intel.com" target="_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1ny" style="overflow:hidden">You could just directly put the nativesdk-libx11 in place of the variable, no need to have the variable there.<br>

</div></blockquote></div><br>yes, that&#39;s what I had initially, but found it was less easy to read... with X11DEPENDS it&#39;s more &#39;obvious&#39; that there is something special.. that said, i can make the change if that&#39;s really needed.</div>

<div class="gmail_extra"><br></div></div>

--047d7b339a3f2c746d04de6ac0dc--
