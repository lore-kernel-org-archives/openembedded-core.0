Received: from mail-ob0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U74kz-0007vp-5F
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 14:58:41 +0100
Received: by mail-ob0-f173.google.com with SMTP id dn14so4926866obc.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 05:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=CEIW5tnHoUDf9Yv9zP2olKEJf1iCCIV62VPEOpW5OP0=;
	b=DKiwwSYcLLw9mvS40HmN1lYEjcGd6QUHIOG83kAhMdsx4KpK1SJOaKeVSGc3+a6Q7g
	GAMX4zbcmRfSNemmzEs2FCmvD1gevfrZ1ilUyKeADSK+dPJcSfqGCEmZZo3cTinDkbOr
	bkP9C109nRicwGCkQ8uZkA8y7HJDS6BcA1ag9mhTWVJ0MHQIUFTxmoayJUmWgr+OfI5U
	xY7+hlGABgFmF5k25/PvXDIy8pLkbZgeN/GdK3593VfR7pL8RS6D8gpXZX69Xlw6jvPG
	Howuq34S25fgq1DpRjYyagmV+T4pJ3IOaXP0Dq9b0mZHzMQ3jhthTIYFOsOfjo2nq9pD
	1eog==
MIME-Version: 1.0
X-Received: by 10.182.88.103 with SMTP id bf7mr4860752obb.7.1361108530172;
	Sun, 17 Feb 2013 05:42:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sun, 17 Feb 2013 05:42:10 -0800 (PST)
In-Reply-To: <1361087577.31795.106.camel@ted>
References: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
	<1361049644-27904-3-git-send-email-otavio@ossystems.com.br>
	<1361087577.31795.106.camel@ted>
Date: Sun, 17 Feb 2013 10:42:10 -0300
X-Google-Sender-Auth: OXaO3QRMnNjRwYns09Ug3cI3URw
Message-ID: <CAP9ODKqd_DbKPHu_FYnHAR2TRqb8Ouw3XuonR43P6Ze0zT9qRQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] libsdl: Use 'virtual/libx11' instead of hardcoding nativesdk-libx11
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
X-List-Received-Date: Sun, 17 Feb 2013 13:58:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 17, 2013 at 4:52 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2013-02-16 at 19:20 -0200, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>> index e25c597..3dbe97a 100644
>> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>> @@ -16,7 +16,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
>>             ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
>>             ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
>>             tslib"
>> -DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
>> +DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
>
> Don't you mean virtual/nativesdk-libx11 ?

Other places are using virtual/libx11 so I sticked to it. For me it
has worked but I did not change if it'd choose the right package when
building with 'x11' (as my project now builds without it).

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


