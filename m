Return-Path: <net147@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 826AE618B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:11:56 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id tj12so2381089pac.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=KAUsthioi9ZRSoiqD4x7DJFGmHOx4axMCxIG56Ifpes=;
	b=yOn15cm2VZilRfALDmCHuRZFXo49e9jTTZSll7LGukfINvp+e44iVZUlDHqnRXZI+F
	4Lg6HjRk/ko59zLbWEjPNg1NeFlsValCaTLmDgjSHhrVLsDzLRMn1e3Pc7zd9ktSm4/e
	46Eyf1uymLmUY/KyZMU3tdZzpUKmWWo69bTe25SzxPBMJF8utmf6ir687HJ/7U3UgX4I
	TaNO+9HpIolfdyFYpMMwmeLcBnQhFMypkXn6t32jnLfkisou4VRrGz9vGFek3zXqV49I
	h87TWOwBU806aA3nQOLeG7FSAbXLF22i1MVUAWDa+M3eWpT86RRSd8Oyf7gm4l75pujZ
	xCkQ==
X-Received: by 10.68.1.226 with SMTP id 2mr10975802pbp.150.1372421517486;
	Fri, 28 Jun 2013 05:11:57 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id xe9sm7891973pbc.21.2013.06.28.05.11.54
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 05:11:56 -0700 (PDT)
Message-ID: <51CD7C66.3020702@gmail.com>
Date: Fri, 28 Jun 2013 22:07:02 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1371254791-8168-1-git-send-email-net147@gmail.com>
In-Reply-To: <1371254791-8168-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4e.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Fri, 28 Jun 2013 12:11:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 15/06/2013 10:06 AM, Jonathan Liu wrote:
> The class is inheriting qmake2.bbclass which exports OE_QMAKE_QT_CONFIG
> pointing to the qt4 qconfig.pri when it should be pointing to the
> qt4-embedded qconfig.pri.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/classes/qt4e.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
> index de2a68d..13b1050 100644
> --- a/meta/classes/qt4e.bbclass
> +++ b/meta/classes/qt4e.bbclass
> @@ -9,6 +9,7 @@ QT_LIBINFIX = "E"
>   # override variables set by qmake-base to compile Qt/Embedded apps
>   #
>   export QMAKESPEC = "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/${TARGET_OS}-oe-g++"
> +export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/qconfig.pri"
>   export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_NAME}"
>   export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
>   export OE_QMAKE_LIBS_QT = "qt"
Hi Saul,

Do you have a log of the error you had building qt4-embedded with this 
patch?

Regards,
Jonathan

