Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 99E3D60F77
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 15:41:01 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tp5so16530690ieb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=x4cU8rT5hou+k9COQCHPN8bcEHxKO0vg9ctZ60n+jYU=;
	b=UxYT6PgBvhEL59H80+mEqr0Mp4l/sjACk8jWU96+BAXbbp3mYayBKCa9OQNEASEzlf
	8yWa4t28uSunRKSiKq1Oa8E5xjeimStEYRIsKnFbuzxYFy9hxFAHzeu6pcnjQJPlUNuV
	b3eBzQERYrA52Vlf+D/TNFXb1ibQfQLWOWRtChl9EeV1SQbJoEkrh5MnocvQlVP7JvY9
	KTnNF9PpEinTYoJi0ahI49Xi0khNkdw4WhkaGH3dovGmOGCVvJNRxlvvRAzfV3DWZC1f
	ISYcS/COlrsE2fIbhzd2+pW5at6K4uJnaxnBNofMMasIk2tp9b2VYJW+3V4HNIl+Ta4Y
	G6mA==
MIME-Version: 1.0
X-Received: by 10.42.61.147 with SMTP id u19mr17565860ich.36.1381160463105;
	Mon, 07 Oct 2013 08:41:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Mon, 7 Oct 2013 08:41:03 -0700 (PDT)
In-Reply-To: <2BC32295742BF14CA5950C3659567EB677B19E@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1381158916-2648-1-git-send-email-otavio@ossystems.com.br>
	<2BC32295742BF14CA5950C3659567EB677B19E@039-SN1MPN1-003.039d.mgd.msft.net>
Date: Mon, 7 Oct 2013 12:41:03 -0300
X-Google-Sender-Auth: jRpe8D98wE19a1yt9tl9i0UQDgc
Message-ID: <CAP9ODKp3PVoaB52aa9LHzh5hZmcm23-3Lh+ssxOyC6p4DiQqcw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Post Lauren-RAA013 <RAA013@freescale.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-config.bbclass: Fix use without IMAGE_FSTYPES appending
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
X-List-Received-Date: Mon, 07 Oct 2013 15:41:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 7, 2013 at 12:30 PM, Post Lauren-RAA013
<RAA013@freescale.com> wrote:
> This works and is needed otherwise we can't set the UBOOT_CONFIG for uboot configs that do not require an FSTYPE.  Please accept this change otherwise some of our uboot builds are broken.

Thanks for confirming it worked for you.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

