Return-Path: <prvs=0434129fea=mike.looijmans@topicproducts.com>
Received: from mx18-out11.antispamcloud.com (mx18-out11.antispamcloud.com
	[207.244.64.180])
	by mail.openembedded.org (Postfix) with ESMTP id A7E8A78285
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 11:31:31 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dtuGw-0001eN-2l; Mon, 18 Sep 2017 13:31:31 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 Sep 2017 13:31:27 +0200
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
Date: Mon, 18 Sep 2017 13:31:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: PqwsvolAWURa0gwxuN3S5YEa3T7JuZT23fGO2rGt3ZgWMD8gia7lRmdoHJ3n0cm6Vtfp9X1ZBchZ
	wvx8a7dTUQWF0kx98HH3GX+iQK7NiP6LBDMrD7q/cJogwbqzsuokIXMJ1U4MKKnQ5SAJ1V9dkP9x
	bu57BDazLmklZgT7xzZL0C50qJLwXsK4Th5w0YRwXabFjBE7JtRRCjjlCMO3+P5nG/euvHp9d3A3
	yTn8aN08CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9G2DCX9m2p4wUnZpURALMKaPBcC9OMLR/g2nFXNsLRUFiC4eHE8lE
	wHRjDhTkZPfRx+S2PnaZiEtp5WzVTa8IOe7fLM7Ww0jFUCG51FTiiz6cR64dodD7udB+zcx8OjSt
	1b1YgBvhxKfoFZHs3o0j+S0jv2y8/jlUqm+TeNrMp4+EE+rDN/FnSl88wIa35p4FFXznVNpEBSRM
	35KuCE6M5jOyxQgNyqqf/IN48z1lpo6ODRmiSLYXQoEVxAAhr5KC2/vg7iEFLP+SSY+Av5+AiC4K
	XP3vTB7AsR5+kaiIjlO6Iw9C0PQ5NLyrXuzfSqvsyY+JnG9TjNQ1CtUj+dcMYHF8JmFmLZ6h3eau
	qEcwyeT0VZvJGSxm4bcH1lFUB/zPeGsnJ395jBJAgljEd2a/UHQV6Xe4bIYRHe1fiVaECIfGCs+d
	m3T5GTMS0IoMjuD73NkW0hXdwXAcFMPC3HLevdBVK0LjZ6+HQ46qHOV5qVX7s/U6AqbH6YaJDh6j
	eW1iMW0/cgevuZFEF1D6sQqSqGeY1vq9X/05xtXkJOYHAFNlHmI1rSMXGtb/41i2T2GPJg==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [PATCH 1/2] base-files: profile: Do not assume that the 'command' command exists
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
X-List-Received-Date: Mon, 18 Sep 2017 11:31:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 18-09-17 10:49, Peter Kjellerstedt wrote:
>>=20

Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail



-----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Mike Looijmans
>> Sent: den 18 september 2017 10:39
>> To: openembedded-core@lists.openembedded.org
>> Cc: Mike Looijmans <mike.looijmans@topic.nl>
>> Subject: [OE-core] [PATCH 1/2] base-files: profile: Do not assume that
>> the 'command' command exists
>>
>> The "command" shell command appears to be a bashism, the standard
>> busybox shell doesn't implement it.
>>
>> This avoids the following error when logging in to a host that does
>> not have the 'command' command:
>>
>>      -sh: command: not found
>>
>> It also simplifies the code and reduces the number of forks.
>>
>> Fixes: e77cdb761169e404556487ac650dc562000da406
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>   meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
>>   1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/reci=
pes-core/base-files/base-files/profile
>> index ceaf15f..b5b533c 100644
>> --- a/meta/recipes-core/base-files/base-files/profile
>> +++ b/meta/recipes-core/base-files/base-files/profile
>> @@ -22,14 +22,12 @@ if [ -d /etc/profile.d ]; then
>>   	unset i
>>   fi
>>
>> -if command -v resize >/dev/null && command -v tty >/dev/null; then
>> -	# Make sure we are on a serial console (i.e. the device used starts wi=
th
>> -	# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
>> -	# tries do use ssh
>> -	case $(tty) in
>> -		/dev/tty[A-z]*) resize >/dev/null;;
>> -	esac
>> -fi
>> +# Make sure we are on a serial console (i.e. the device used starts wit=
h
>> +# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
>> +# tries do use ssh
>> +case $(tty 2>/dev/null) in
>> +	/dev/tty[A-z]*) resize >/dev/null;;
>> +esac
>>
>>   export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>>
>> --
>> 1.9.1
>=20
> This is basically the same change as I first sent a patch for in April, a=
nd
> last pinged this Friday... The only real difference is that this one miss=
es
> passing error output from resize to /dev/null (which it should do to hand=
le
> the case where tty exists, but resize does not).

Yeah, indeed.

Other problem is that "resize" outputs shell script on stdout to be execute=
d,=20
so the proper "total" invokation would be:

   /dev/tty[A-z]*) eval `resize 2>/dev/null` ;;

The "eval" part is missing in your version...

