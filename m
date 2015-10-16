Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 5662 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Oct 2015 08:34:46 UTC
Received: from mx12-14.smtp.antispamcloud.com (mx12-14.smtp.antispamcloud.com
	[46.165.232.184])
	by mail.openembedded.org (Postfix) with ESMTP id E6E9B77104
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:34:46 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Zmyzy-0001Lo-6J; Fri, 16 Oct 2015 09:00:23 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 16 Oct 2015 08:59:15 +0200
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1444930021-4096-1-git-send-email-benjamin.esquivel@linux.intel.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <5620A07B.3050305@topic.nl>
Date: Fri, 16 Oct 2015 09:00:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1444930021-4096-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw2J5GBx252Ab16YyDNM+LRqTbaPheG5f/yAYx656dlpINlc+l3JfrXHsIjFHUvXSqQbx
	1ne9y3XvI0+mx5p2dKLUfvB6I01ydwembqKuX8PJ6r3/EJS4LI2YLWtNB13p18cnDcUd8qFUpIXo
	5SW/J+XJ9emfnmuXfjOpAtIS+F6cFQgdnmUCEH6SHn7oLuLWubqPYxLftQT/9w8dxcs1sTzbVc+j
	w8VpL+3QldIF3PSXcyrkpVZFBqMDoM8J8RPNz0Ivn3zuRevLaVHu7Hq1DCiMPmUsgvg0DBDoTPFL
	rMj517NirEYyqwqMBGrw8ELiqICgcRTMSbwn3+TIPsF6f2myBvInnOzNy+HoOJeciUa+fqb5R4Ve
	muUI6bcEARsm0BDXaLofLQsMb6NHLIB1iw1Tco5wBj7snSaoHcZEu7NwoY5DH2aqsqtgY6rjC8YU
	MMqScuaSWO4wwuxYneZpZbOFbzga535qa02/HXUwWd5Khj8LqERgwvQj8q9qZrF5LYn5y/vcIKE4
	+MoDT8NV3zdKb4GUSHXV2BgUYrF39Tbk7QbCzoUXqnh1UF6hOFEZmNIQcX29vSmXVP1wjD+mC8xb
	hUiQM2YceNUeNlXcNhzekVWClPVvbW5lVyQanRxw5v4sByncDKxV/S8sjTIxY5l8SUluYL42FkNA
	sNAZPvdGbtyH4syOq9lqU65xjA8OLbhEm0sAMFg7WQAXeyWKDhUaWhakvFjmpkhsaxcAZ4kA
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH] populate SDK: prepare calling of bb.utils for exceptions
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
X-List-Received-Date: Fri, 16 Oct 2015 08:34:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 15-10-15 19:27, Benjamin Esquivel wrote:
> bb.utils.remove, bb.utils.movefile and bb.utils.mkdirhier can throw
> exceptions that need handling and proper error messages.
>
> [YOCTO#8213]
...
> +    def mkdirhier(self, dirpath):
> +        try:
> +            bb.utils.mkdirhier(dirpath)
> +        except OSError as e:
> +            bb.warn(str(e))
> +            bb.error("cannot make dir for SDK: {}".format(dirpath))
...


I see two bad things happening here:

- This will print a message, but continue processing as if nothing bad=20
happened, wreaking havoc later on when the caller might expect the director=
y=20
to actually exist and raise exceptions that are much harder to solve.

- It loses the information in the original exception, and since it doesn't=
=20
throw a new exception, the user is now left in the dark as to where the=20
problem occured, since there's no stack trace now.


For what I see in this code, it will actually make thing worse by hiding=20
errors and obscuring information. You're not "handling" the exception here,=
=20
you're almost "ignoring" them, which isn't quite the same.



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






