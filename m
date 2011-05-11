Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QKBZ9-0006NQ-HL
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 17:43:12 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 38E8F1660165; Wed, 11 May 2011 09:40:25 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 81FD81660350;
	Wed, 11 May 2011 09:39:44 -0600 (MDT)
Message-ID: <4DCAADC0.9030106@mlbassoc.com>
Date: Wed, 11 May 2011 09:39:44 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
References: <4DB99F31.4000308@mlbassoc.com>	<BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>	<BANLkTi=G-4UfXNdnJSy7qF3gb0-xLr6+4Q@mail.gmail.com>
	<4DBEAA2C.1020601@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D88F0101@orsmsx504.amr.corp.intel.com>
	<4DCA6C60.6050203@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D88F0328@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94D88F0328@orsmsx504.amr.corp.intel.com>
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Wed, 11 May 2011 15:43:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2011 09:35 AM, Kamble, Nitin A wrote:
>> Yes, that's the only change.  Building the kernel from the same
>> source repository with 4.5.2 (using patches from you and Khem Raj)
>> works perfectly.
>>
> Hi Gary,
>    The yocto-linux kernel had to go through few changes to mute some compiler warnings with gcc 4.6.0. Are you building your own kernel?

Yes.  It's roughly based on the Angstrom 2.6.37 with BeagleBoard
support (I have additional OMAP boards which are not in the public
tree).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


