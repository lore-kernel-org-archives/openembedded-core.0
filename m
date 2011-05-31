Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRV7I-0004Kv-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 22:00:40 +0200
Received: by bwz5 with SMTP id 5so4541654bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 12:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=DlFoWxVGRjdd2eO5r3fbWMC1SkraXPq/gvypxN6Asfs=;
	b=XgqUI2j3wBCJJI+Aq5dEKBdQXXDy/t67d4vdDvbTqEzHZb7tzJIqdYXpAS9Ab6Bi7e
	x3iVhmnTpDdjdVKlYy7PRLmQjkrpjjHOiHC/JigoqhWn95tiOOfxiDyrnlaJR8relWCL
	CihZ357CaHEl/j41V4HmTORGDSRrjW7TXzhvM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=NyJXR+2iizOxsXxKHkh4FiHACUfSaFr2lZrkRbXKb8u/ZYPDl2OXIfC1TUKGtDWt9V
	/L5MQoFVVmJjqgWmTXLyCc+osq0Jjef+8FfJt6jJmKCcSlkDpq7VM42XHgWvdrF4CiCI
	q1DxCLo909sumr8WapHB6LgGLspoznZUukvRM=
MIME-Version: 1.0
Received: by 10.204.47.18 with SMTP id l18mr6108764bkf.31.1306871850585; Tue,
	31 May 2011 12:57:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Tue, 31 May 2011 12:57:30 -0700 (PDT)
In-Reply-To: <4DE546AE.1090301@intel.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<79A1BC44-8268-4177-BBC5-4A5B08BDC8B7@dominion.thruhere.net>
	<4DE53C21.7020000@linux.intel.com> <4DE546AE.1090301@intel.com>
Date: Tue, 31 May 2011 19:57:30 +0000
X-Google-Sender-Auth: qapD-gTwraLerEfSG9KFtVFGYbI
Message-ID: <BANLkTimmP7rDQidBOBbA8TqVtHKMF7Bhuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"poky@yoctoproject.org Project" <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH 0/7] User/group creation at preinstall
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2011 20:00:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 19:51, Scott Garman <scott.a.garman@intel.com> wrot=
e:
> That said, I have no idea what criteria should be used to determine which
> list to send things to, and I'm sure I'm not the only one. Is this
> documented anywhere?

It seems to me that poky list ought to be not used anymore and patches
to be send to oe-core as AFAIK Yocto will base on it. Am I missing
anything?

This is really confusing. This is not just regarding mailing lists but
also IRC channels :-/

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


