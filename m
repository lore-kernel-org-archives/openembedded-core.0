Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QSAoU-0002zI-Q1
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 18:32:07 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QSAlP-0007lC-Ba from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 09:28:51 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 2 Jun 2011 09:28:51 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 2 Jun 2011 09:28:50 -0700
Message-ID: <4DE7BA3F.4060600@mentor.com>
Date: Thu, 2 Jun 2011 09:28:47 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306931844.git.dexuan.cui@intel.com>	<4DE67440.1020405@mentor.com>
	<1306950977.27470.461.camel@rex>	<4DE69582.2090508@mentor.com>	<1306958729.3119.3.camel@lenovo.internal.reciva.com>	<4DE6A43A.3050401@mentor.com>	<1306961135.3119.13.camel@lenovo.internal.reciva.com>	<4DE6A836.3040004@mentor.com>
	<1307023591.27470.549.camel@rex>	<4DE79D69.7080806@mentor.com>
	<1307025426.2529.209.camel@phil-desktop>
In-Reply-To: <1307025426.2529.209.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 02 Jun 2011 16:28:51.0097 (UTC)
	FILETIME=[2815B090:01CC2142]
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Thu, 02 Jun 2011 16:32:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/02/2011 07:37 AM, Phil Blundell wrote:
> On Thu, 2011-06-02 at 07:25 -0700, Tom Rini wrote:
>> But help2man is just the easy/common case.  Heck, it _may_ blow up even
>> with the host help2man instead of help2man-native, if a recipe uses
>> system-wide help2man and perlnative.bbclass.  The root problem (again,
>> from memory) is that since we modify PERL5LIB and so on, when we do
>> that, we've opened ourselves up for system-wide perl trying to use
>> perl-native's stuff.
> 
> Ah right, I think I see what you're getting at now.
> 
> If we've got a clean separation between perl-native and host perl,
> though, can't we now just eliminate all of that futzing with PERL5LIB in
> cpan.bbclass and such like places?  perl-native already knows how to
> look in the right places within the sysroot for its modules so there
> should be no need for anything else to be overriding it.

Well, my question is, does it, really?  Even if we're using the sstate
cache from /foo/oecore/tmp over in /bar/oecore/tmp (and /foo/oecore/tmp
is rm -rf'd) ?  Since we've got a create_wrapper around perl and
perl${PV} it should be I suppose (or is easily added there), but I'd
feel a lot better with some testing of the above case (and the updates
to cpan*bbclass).

-- 
Tom Rini
Mentor Graphics Corporation


