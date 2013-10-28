Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 434A16D455
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 22:48:46 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so12196418iec.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bGunznwXJRGQ1GjoWg9g2vnCXiDOHXPQsb5P/soJceM=;
	b=JSVLSIQrZfOkJTK73OFL4LVwLM3Hq93Bf10voBXYqXJgizFjDpl5SMcSFmmrsfArCS
	TsgOQ4GEGmgnwgKTd/KQsZrGgQKiYbicpr2CN69tVDhvEghrwvrYogO5gceRMhqjMSiO
	wEGZM158Pe1w6r6rXJiI+T/zq+Yp55pv+zVQHjNGErv17lHOppLE66T53t58A5TmgUJt
	XEm5EItajFFbxbJS/vZUDOvXfGqbQt4xji4oJYlhdrFmZ2k4HITsO0ygjjEFHNyzV+jR
	pyi1HIwqsX79+UetMdSyQvWtY+A8GGW9P6AdZzioTf1hBgORmjHyHjs0KdMlIxd7sp0X
	wv8g==
X-Received: by 10.50.22.67 with SMTP id b3mr10225795igf.39.1383000527703; Mon,
	28 Oct 2013 15:48:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Mon, 28 Oct 2013 15:48:17 -0700 (PDT)
In-Reply-To: <526ECEBE.508@communistcode.co.uk>
References: <1382345775-1338-1-git-send-email-ml@communistcode.co.uk>
	<CAMKF1spfQ7hiR8S_=cboV1+p2B4yMF+vqfHpWr1bha883MbvTg@mail.gmail.com>
	<526ECEBE.508@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2013 15:48:17 -0700
Message-ID: <CAMKF1sqChkPK36LNdP2x5WcWgB51md8iB4x9V3cUEPEB5M2OfA@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCHv2] libjson: update to 0.11 and rename to json-c
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
X-List-Received-Date: Mon, 28 Oct 2013 22:48:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 28, 2013 at 1:53 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> As for the BPN-PV, I don't really understand, I just grepped for libjson,
> and changed all the occurrences... the separate build dir being one of them,
> how would you expect the change to look?

just in SRC_URI use BPN-PN instead of P

