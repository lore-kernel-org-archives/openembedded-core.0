Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYCwz-00037a-JN
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 09:34:01 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 8C3E4141FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 09:27:13 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApAbAPki305T4zgTPGdsb2JhbAAMN4lNoSwBAQEBN4JjQD0WGAMCAQIBMScIAQG9VIgagxgElGaSIQ
X-IronPort-AV: E=Sophos;i="4.71,313,1320620400"; d="scan'208";a="1770043647"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb4.telenor.se with ESMTP; 07 Dec 2011 09:27:13 +0100
Message-ID: <4EDF2360.7090402@emagii.com>
Date: Wed, 07 Dec 2011 09:27:12 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Possible stale tags in the download directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 07 Dec 2011 08:34:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


When I look at the "downloads" location I find a lot of files called.

"11_usagi_fix.patch.done"

but no  "11_usagi_fix.patch" file in the directory.

If this is a indication of that a patch has been downloaded,
what happens if you for some reason or other delete your
OE-core directory and keep the downloads directory.

When you start from fresh, all the tags are then stale.

(Deleting the "downloads" directory seems a bad idea)

I think that if there should be tags in the "downloads" directory,
they should only reflect things which are downloaded to the
"downloads" directory, and nothing else.

As for the tags in the directory, I think a better approach
is to download a file "tarball.tar.bz2" to a different filename first
I.E: "tarball.tar.bz2.in-progress"  and if the download completes
then move the file to "tarball.tar.bz2".
Should remove a lot of clutter from the "downloads" directory.

-- 
Best Regards
Ulf Samuelsson
eMagii



