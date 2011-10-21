Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RH8TP-0006oU-VX for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 08:20:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RH8Nk-0002Qh-Qf for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 08:15:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:15:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:15:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Oct 2011 08:13:35 +0200
Message-ID: <j7r2if$7jb$4@dough.gmane.org>
References: <CAMKF1sqwC26Qo2MPCmNcwvsqweC-8F1P2y9myNOgihrBtCdTXA@mail.gmail.com>
	<20111021002021.GV26170@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <20111021002021.GV26170@denix.org>
X-Enigmail-Version: 1.3.2
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [ANNOUNCEMENT] New Patchwork available for testing
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
X-List-Received-Date: Fri, 21 Oct 2011 06:20:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-10-11 02:20, Denys Dmytriyenko schreef:
> On Mon, Oct 17, 2011 at 12:06:04PM -0700, Khem Raj wrote:
>> Hi
>> 
>> Here is a new instance of patchwork accessible at 
>> http://patchwork.openembedded.org
>> 
>> This instance uses same database therefore it should not be any
>> different than existing patches.openembedded.org
>> 
>> However with the new patchwork you will see additionally "Mail
>> settings" link on the right hand upper corner this could be used to
>> subscribe to patchwork activity. This is a new feature so try it out
>> and report any issues.
>> 
>> The patch capturing is done by the new patchwork.
>> 
>> reiterating what Koen already announced, git post-recieve hook is 
>> installed for meta-openembedded repository to interact with patchwork 
>> on push so it will change the state of patch to "Accepted" once it has
>> been pushed. This should avoid lot of manual work for the maintainers
> 
> Does this work for pull requests?

Yes, except for the coverletter, you need to archive that one manually.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOoQ2PMkyGM64RGpERAs6NAJ9F3xzg0VCswRttYTu0VSdKJZuQsACfa6/+
psGXYPWGqACD0cQKaeNbdh8=
=K4Xv
-----END PGP SIGNATURE-----



