Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id D1A4760D9D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 02:54:52 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id p10so2346648pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 18:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=AbwJlihFY77bT0NAihMCxWijzEuc0LvdcYC8GJ4ekJo=;
	b=FxUm8F+AgEwxreu0UHR/dViBi/UIF4q0fyHTOi6KBbmbosI0xGpESiMbw6RPTAu1Yu
	2xQAPBYqDhejJ6yjr3RwK5odiRbvgzWH+JFEYFvJ2tctVh+Aw8skubS/E0CXAPxiINf5
	7I2+xKR/RO3spCY6C+XlSrP6WCVriA7OlUWf0b9nSdm+/ifU2r8bPRD2KUtROg6KPGBK
	KOTSUrOd8feerEcklppC/hB9/TYOsqXnXTvyUk67QgNTohsichqvfMS8+cK2yvuSez24
	SWz+1KdIlBMqCtZDG2/X2bdK2nQviqRjdePBptfQLYlgK5i5Z3E1ZmT96AVVj6A76qOG
	Y+Mw==
X-Received: by 10.68.108.1 with SMTP id hg1mr12108415pbb.80.1393728893692;
	Sat, 01 Mar 2014 18:54:53 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id g6sm50959168pat.2.2014.03.01.18.54.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 01 Mar 2014 18:54:52 -0800 (PST)
Message-ID: <53129D76.9060802@gmail.com>
Date: Sun, 02 Mar 2014 13:54:46 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1393729091-12840-1-git-send-email-net147@gmail.com>
In-Reply-To: <1393729091-12840-1-git-send-email-net147@gmail.com>
Subject: Re: [meta-qt5][PATCH v2 1/2] qtimageformats: allow empty qtimageformats package
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
X-List-Received-Date: Sun, 02 Mar 2014 02:54:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/03/2014 1:58 PM, Jonathan Liu wrote:
> This fixes installing qtimageformats-dev with opkg as it depends on the
> qtimageformats package which wasn't created.
>
> The qtimageformats package was not created as it is empty and BitBake
> avoids producing empty packages by default. The installed files consist
> of source files split into qtimageformats-dbg, CMake files split into
> qtimageformats-dev, plugins split into qtimageformats-plugins and
> debug build of plugins split into qtimageformats-plugins-dbg.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   recipes-qt/qt5/qtimageformats.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/recipes-qt/qt5/qtimageformats.inc b/recipes-qt/qt5/qtimageformats.inc
> index 1b4bb4f..f90e58a 100644
> --- a/recipes-qt/qt5/qtimageformats.inc
> +++ b/recipes-qt/qt5/qtimageformats.inc
> @@ -1,3 +1,4 @@
>   require qt5.inc
>   
>   DEPENDS += "qtbase tiff"
> +ALLOW_EMPTY_${PN} = "1"
Whoops, wrong mailing list.

Regards,
Jonathan

