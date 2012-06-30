Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SkzsJ-000313-El
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 17:46:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5UFZK0E014274
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2012 08:35:21 -0700 (PDT)
Received: from msp-dhcp17.wrs.com (172.25.34.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 30 Jun 2012 08:35:20 -0700
Message-ID: <4FEF1CB7.3000908@windriver.com>
Date: Sat, 30 Jun 2012 10:35:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1206300847330.17264@oneiric>
	<CAK18fxGKQrqrtZK2m3Qi9qECSXMVpzhOGzbua3or19UAoGrUSw@mail.gmail.com>
	<alpine.DEB.2.02.1206301057240.23189@oneiric>
In-Reply-To: <alpine.DEB.2.02.1206301057240.23189@oneiric>
Subject: Re: does it make sense to define INITSCRIPT_* without inheriting update-rc.d?
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
X-List-Received-Date: Sat, 30 Jun 2012 15:46:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/12 9:57 AM, Robert P. J. Day wrote:
>
> On Sat, 30 Jun 2012, Andrei Gherzan wrote:
>
>> No. It won't make a difference. Or actually it makes a tiny
>> difference: check package.bbclass, function named gen_packagevar.
>>
>> On Sat, Jun 30, 2012 at 3:50 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>
>>         currently figuring out details of INITSCRIPT_*, and noticed that the
>>        recipe file irda-utils_0.9.18.bb assigned values to both
>>        INITSCRIPT_NAME and INITSCRIPT_PARAMS without inheriting update-rc.d.

Anything using those variables should inherit the class.  Otherwise it may not 
work as expected down the line when things change.

The purpose of the classes for useradd, update-rc.d and alternatives is to help 
automatically generate the pre/post package install scripts in a standard way.

Eventually I would like to see all of the manual pre/post scripts disappear in 
favor of class generated.  This will help us manage transitions to new 
technologies such as systemd...

>>         is that allowed?  does it make sense?  unless the explicit
>>        do_install() routine in that recipe file somehow takes care of things.
>>
>>        rday
>
>    i'm unclear on what i'm supposed to be looking at in that function,
> and how it answers my question.


