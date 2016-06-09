Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-11.clustermail.de (good-out-11.clustermail.de
	[212.223.35.73])
	by mail.openembedded.org (Postfix) with ESMTP id A5F986FF4E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 08:44:07 +0000 (UTC)
Received: from frontend-05 ([10.0.0.5] helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtps
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84_2)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1bAvXs-0002q9-KZ; Thu, 09 Jun 2016 10:44:05 +0200
Received: from [217.6.33.234] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpa (Exim 4.84_2)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1bAvBz-0000nZ-61; Thu, 09 Jun 2016 10:19:55 +0200
Received: from Win2012-02.gin-domain.local (192.168.1.12) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1130.7; Thu, 9 Jun 2016 10:19:54 +0200
Received: from Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90]) by
	Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90%12]) with mapi
	id 15.00.1130.005; Thu, 9 Jun 2016 10:19:54 +0200
From: "Klauer, Daniel" <Daniel.Klauer@gin.de>
To: Mark Hatle <mark.hatle@windriver.com>, Herve Jourdain
	<herve.jourdain@neuf.fr>
Thread-Topic: [OE-core] [PATCH] smartpm: Don't ignore error if RPM transaction
	fails without problems
Thread-Index: AQHRsDtANli+hgUYC0ONri+JdCfiKp+89YIAgCEGQ4CAAXiob4AAErOAgABIKAP//+3UAIAAA2QAgAAITACAASLWLw==
Date: Thu, 9 Jun 2016 08:19:53 +0000
Message-ID: <1465460392811.42840@gin.de>
References: <1465381435600.39214@gin.de>,
	<bac958a1-9a5e-3bdc-0d83-0dcff153dd22@windriver.com>
In-Reply-To: <bac958a1-9a5e-3bdc-0d83-0dcff153dd22@windriver.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.1.219]
x-brightmail-tracker: H4sIAAAAAAAAC+NgFvrGqsTGxXJgBSOP7iq1yHCDjb297/gtfq55ymZxfd4+ZovDC6cwOjAHMESxZuYl5VcksGbMub6RteC1f8WyLQfZGxifencxcnEICexmlJg8+TcLhHOCUeLLuavMXYycHMwCphJXvjayQNiKEhfuNYDZbAK6Eufa37OC2CICIRIfJ+9ihKiJlrjz+ww7iC0skCbxec8TFoiadIkLf9ezQdhZEisW9oPVSwjoSPxd1Ag2h0VAReLJvzlgvbwCGhLXbixmArGFBGIlVrRfBavnFHCU2PK9G+w2RgFZic6Gd0wQe8Ulbj2ZzwQxU0BiyZ7zzBC2kkTv7XdQcSOJCW/XM0HMF5Q4ORPiNgkBM4m9D5YAxTmAbD2JvW/yIcKBElc7D7FChE0lrr4PhggbSLxb+xmq01hi5cb/UJ/YSuyZMRFqirPEvBv1EGEniTcdb1khbG2J7a/2scI8vunaKpYJjJqzkMJ5FlI4z0Ly1ywkNy9gZFnFKB2emWdkYGika2Ckl56Zp5uSn5uYmaeXk5+cmLOJEZomdjA++ux6iFGSg0lJlPeOVGS4EF9SfkplRmJxRnxRaU5q8SFGCQ4eJRHeRhWgHG9xQWJucWY6TEqGg0NJgnc3SEqwKDU9tSItM6cktQgifYpRUkqcV00VKCkA0pdRmgeXu8QoKiXMmyYJlOMpSC3KzSyBiN9iFOZ4yCTEkpeflyoFdCIDEGgwvmIU52BUEuZlApnFk5lXAnfCK6DrmICuW34kHOS6kkSElFQDoyvvxSOVvj6rLble1ua6bVdRCsg3nCbSErQkLl7k0KeXDbtXrGFc/HK9vcd+1oZTbfG1rkc/8l1ex73EVHvypJ1bOiKjfKZuuqmp/OHhyqSgNIP9/e9uN4u+nbD55MLCBaEPo1QnNQo/+/nFqXTihqbgdy+fGM9YyJRvLHPZ+u8a/dValifq/yqxFGckGmoxFxUnAgA6pTXOiQMAAA==
MIME-Version: 1.0
X-Cyberoam-smtpxy-version: 1.0.6.3
X-Cyberoam-AV-Policy: default
X-CTCH-PVer: 0000001
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: 0
X-CTCH-RefID: str=0001.0A0C0203.575926AB.0062, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-Score: 0.000
X-CTCH-ScoreCust: 0.000
X-CTCH-Rules: 
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] smartpm: Don't ignore error if RPM transaction fails without problems
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
X-List-Received-Date: Thu, 09 Jun 2016 08:44:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,=0A=
=0A=
the case I encountered the original issue with was a partially broken RPM d=
atabase, which allowed the "Computing transaction" to work, but failed at "=
Committing transaction" when installing a package.=0A=
=0A=
To reproduce it, the RPM database can be broken intentionally:=0A=
# echo foo > /var/lib/rpm/Arch=0A=
=0A=
Then try to install some package...=0A=
# smart install|reinstall|upgrade <package>=0A=
=0A=
=0A=
SmartPM output & exit code before the fix (commit 1dc5f5d5c844585eec114be94=
80e0e4d8e60d09c):=0A=
=0A=
=0A=
Loading cache...=0A=
...=0A=
Computing transaction...=0A=
...=0A=
Committing transaction...=0A=
Preparing...                    ######################################## [ =
 0%]=0A=
   1:Installing <package>       ######################################## [1=
00%]=0A=
Output from <package>-<version>@<arch>:=0A=
rpmdb: BDB0004 fop_read_meta: /var/lib/rpm/Arch: unexpected file type or fo=
rmat=0A=
error: cannot open Arch(1022) index: Invalid argument(22)=0A=
	DB: Berkeley DB 6.0.30: (January 23, 2014)=0A=
=0A=
Saving cache...=0A=
=0A=
# echo $?=0A=
0=0A=
=0A=
=0A=
And after the fix:=0A=
=0A=
=0A=
Loading cache...=0A=
...=0A=
Computing transaction...=0A=
...=0A=
Committing transaction...=0A=
Preparing...                    ######################################## [ =
 0%]=0A=
   1:Installing <package>       ######################################## [1=
00%]=0A=
Output from <package>-<version>@<arch>:=0A=
rpmdb: BDB0004 fop_read_meta: /var/lib/rpm/Arch: unexpected file type or fo=
rmat=0A=
error: cannot open Arch(1022) index: Invalid argument(22)=0A=
	DB: Berkeley DB 6.0.30: (January 23, 2014)=0A=
error: Unknown error=0A=
=0A=
# echo $?=0A=
1=0A=
=0A=
=0A=
I've only ever tested this with breaking the Arch index database; perhaps t=
he behaviour will be different when breaking another index, and most likely=
 RPM will fail earlier when the main /var/lib/rpm/Packages database is brok=
en. Either way, perhaps this can be used for a test case.=0A=
=0A=
Regards,=0A=
Daniel=

