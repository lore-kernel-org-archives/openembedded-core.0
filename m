Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (lgeamrelo01.lge.com [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id AC3D5741CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 05:33:10 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.222.197)
	by 156.147.1.125 with ESMTP; 16 Jun 2015 14:33:11 +0900
X-Original-SENDERIP: 10.177.222.197
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: "'Richard Purdie'" <richard.purdie@linuxfoundation.org>
References: <1433826505-23893-1-git-send-email-changhyeok.bae@lge.com>
	<1434351291.28975.265.camel@linuxfoundation.org>
In-Reply-To: <1434351291.28975.265.camel@linuxfoundation.org>
Date: Tue, 16 Jun 2015 14:33:14 +0900
Message-ID: <022401d0a7f5$f1102e60$d3308b20$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQE5Pu0PBGRk/iwSOoynevCgWOFdWQGF18xentE9IUA=
Cc: =?UTF-8?B?7J2066qF6rWs?= <myonggu.lee@lge.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] {python, python3}-native: fix TypeError
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
X-List-Received-Date: Tue, 16 Jun 2015 05:33:13 -0000
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: ko

Doesn't this mean BUILD_SYS or HOST_SYS weren't set in the environment?
-> You're right. The default env value of BUILD_SYS and HOST_SYS is "" =
(empty).
-> I wonder that the original patch =
(12-distutils-prefix-is-inside-staging-area.patch) to add  is required?

Wouldn't this patch just mean you get a value of something like "None"?
-> My patch is to prevent errors in runtime.
-> Do you have any other good idea?

Thanks
Changhyeok
-----Original Message-----
From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]=20
Sent: Monday, June 15, 2015 3:55 PM
To: Changhyeok Bae
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [OE-Core][PATCH] {python,python3}-native: fix =
TypeError

On Tue, 2015-06-09 at 14:08 +0900, Changhyeok Bae wrote:
> g-ir-core in meta-gir is building with python-native.
> When the g-ir-core(v1.42.0) is building, following error is occurred.
>=20
> Error in g-ir-core:
> EXEC_PREFIX =3D os.path.normpath(sys.exec_prefix).replace( =
os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> | TypeError: expected a character buffer object

Doesn't this mean BUILD_SYS or HOST_SYS weren't set in the environment?
Wouldn't this patch just mean you get a value of something like "None"?

Cheers,

Richard


