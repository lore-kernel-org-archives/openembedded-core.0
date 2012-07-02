Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SlnSS-0004N2-2F
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:42:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q62KVsjr010396
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 13:31:54 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 2 Jul 2012 13:31:53 -0700
Message-ID: <4FF20539.9030504@windriver.com>
Date: Mon, 2 Jul 2012 15:31:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1341257063.git.mark.hatle@windriver.com>
	<ce879400de83074f4c24961787ec36aad372fb80.1341257063.git.mark.hatle@windriver.com>
	<1341259602.2886.27.camel@x121e.pbcl.net>
In-Reply-To: <1341259602.2886.27.camel@x121e.pbcl.net>
Subject: Re: [PATCH 1/1] oprofile: Change /root to /home/root
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
X-List-Received-Date: Mon, 02 Jul 2012 20:42:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/12 3:06 PM, Phil Blundell wrote:
> On Mon, 2012-07-02 at 14:25 -0500, Mark Hatle wrote:
>> +diff -ur oprofile-0.9.7.orig/utils/opcontrol oprofile-0.9.7/utils/opcontrol
>> +--- oprofile-0.9.7.orig/utils/opcontrol	2011-07-20 14:36:48.000000000 -0500
>> ++++ oprofile-0.9.7/utils/opcontrol	2012-07-02 13:55:06.232872688 -0500
>> +@@ -384,7 +384,7 @@
>> + 	OPROFILED="$OPDIR/oprofiled"
>> +
>> + 	# location for daemon setup information
>> +-	SETUP_DIR="/root/.oprofile"
>> ++	SETUP_DIR="/home/root/.oprofile"
>> + 	SETUP_FILE="$SETUP_DIR/daemonrc"
>> + 	SEC_SETUP_FILE="$SETUP_DIR/daemonrc_new"
>> +
>
> Why is it putting "daemon setup information" in /root in the first
> place?  Surely that should go in /etc or some such place.
>
> Also, the choice of where root's home directory goes is a distro
> decision and, in the general case, it is not correct to say that "OE
> uses /home/root".  Changing the hardcoded value from one thing to
> another is probably not that much of an improvement overall.

systemd (meta-oe), base-passwd, base-files (profile settings), xserver-
nodm-init-2.0/xserver-nodm -- they all have patches that change hard coded /root 
to /home/root.

I don't honestly care which we used, but /home/root has been used as -the- root 
directory on OE since as far back as 2004 from what I can tell.

As for the files, these are files used by the system to setup and store the 
data.  oprofile does this to the root home directory.  I don't know or 
understand why, other then I have a bug in my pile that says oprofile is 
currently broken, as there is no /root directory.

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




