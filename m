Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1U7PSK-0005zB-6l
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 13:04:25 +0100
Message-ID: <512214FE.3030603@communistcode.co.uk>
Date: Mon, 18 Feb 2013 11:48:14 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Relocatable SDK Perl issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 12:04:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The relocatable SDK seems to have had it's perl issues slipped back in 
somewhere.

Running autoreconf -i on my autotools application leads to the following:

Can't locate strict.pm in @INC (@INC contains: 
/mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf 
/opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/site_perl/5.14.3/ 
/opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/site_perl/5.14.3 
/opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/vendor_perl/5.14.3/ 
/opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/vendor_perl/5.14.3 
/opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/5.14.3/ 
/opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/5.14.3 
/opt/dblinux/1.0-20130213/sysroots/x86_64-oecore-linux/usr/lib/perl/5.14.3 
.) at 
/mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf/Autom4te/Channels.pm 
line 70.
BEGIN failed--compilation aborted at 
/mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf/Autom4te/Channels.pm 
line 70.
Compilation failed in require at 
/mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf/Autom4te/ChannelDefs.pm 
line 19.
BEGIN failed--compilation aborted at 
/mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/share/autoconf/Autom4te/ChannelDefs.pm 
line 19.
Compilation failed in require at 
/mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/bin/gnu-configize 
line 40.
BEGIN failed--compilation aborted at 
/mnt/SSD/r0005sdk/130213r0/sysroots/x86_64-oecore-linux/usr/bin/gnu-configize 
line 40.
autoreconf: gnu-configize failed with exit status: 2

Any ideas? This was broken a while ago (~6 months), and then was fixed 
(~2 months) and it seems to have regressed again somewhere along the way.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



