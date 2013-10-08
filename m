Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 501A360CEA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 02:55:26 +0000 (UTC)
Received: from mailserv59-us.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	r982tPxY007889; Mon, 7 Oct 2013 21:55:25 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by mailserv59-us.natinst.com (Lotus Domino Release 8.5.3FP2 HF169)
	with ESMTP id 2013100721552525-53178 ;
	Mon, 7 Oct 2013 21:55:25 -0500 
References: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
	<524F85EA.30805@linux.intel.com>
User-agent: mu4e 0.9.9.5; emacs 24.3.4
From: Richard Tollerton <rich.tollerton@ni.com>
To: Saul Wold <sgw@linux.intel.com>
In-reply-to: <524F85EA.30805@linux.intel.com>
Date: Mon, 07 Oct 2013 21:55:25 -0500
Message-ID: <87li24pj36.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on MailServ59-US/AUS/H/NIC(Release
	8.5.3FP2 HF169|September 14, 2012) at 10/07/2013 09:55:25 PM,
	Serialize by Router on MailServ59-US/AUS/H/NIC(Release 8.5.3FP2
	HF169|September 14, 2012) at 10/07/2013 09:55:25 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-10-08_01:2013-10-08, 2013-10-08,
	1970-01-01 signatures=0
Cc: paul.eggleton@linux.intel.com, gratian.crisan@ni.com, ken.sharp@ni.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [dylan, master][PATCH] autotools.bbclass: Fix race with sed-native
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
X-List-Received-Date: Tue, 08 Oct 2013 02:55:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


sgw@linux.intel.com writes:

>> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbc=
lass
>> index 66c0f5d..2bb2aa3 100644
>> --- a/meta/classes/autotools.bbclass
>> +++ b/meta/classes/autotools.bbclass
>> @@ -7,17 +7,25 @@ def autotools=5Fdep=5Fprepend(d):
>>
>>       if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
>>           return deps
>> -    deps +=3D 'autoconf-native automake-native '
>> +    deps +=3D 'autoconf-native automake-native gnu-config-native '
>>
> You don't mention anything about this change.

This might be a moot topic, but maybe I did miss something here:

I thought it was implied in the =E2=80=9Clight refactoring=E2=80=9D. In the=
 original
code, 'gnu-config-native ' would have always been appended by this point
in the code. I thought the "if ...: return deps" idiom would greatly
simplify this function, but in order to use it, 'gnu-config-native '
needs to be appended before each return. So just append it here.

> Sau!


--=20
Richard Tollerton <rich.tollerton@ni.com>
=

