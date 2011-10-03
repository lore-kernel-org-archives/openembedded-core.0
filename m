Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RAm5P-000520-Bx for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 19:13:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RAm04-0005bb-O9 for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 19:08:20 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 19:08:20 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 19:08:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 03 Oct 2011 21:06:55 +0400
Message-ID: <j6cq5j$snr$1@dough.gmane.org>
References: <CALT56yPoAbv43D_CGsGHMjr+eQxhNUJAW_Ryznoi7Tz8tb7THA@mail.gmail.com>
	<1317653702.13337.4.camel@phil-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
In-Reply-To: <1317653702.13337.4.camel@phil-desktop>
Subject: Re: [RFC] .la files cleanup
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
X-List-Received-Date: Mon, 03 Oct 2011 17:13:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2011 06:55 PM, Phil Blundell wrote:
> On Mon, 2011-10-03 at 14:58 +0400, Dmitry Eremin-Solenikov wrote:
>> My proposal would be to include a special task or a
>> do_install_append() part that
>> will remove specified .la files. (like ${libdir}/xorg/modules/*/.la,
>> ${libdir}/matchbox-panel/*.la, etc.). I see this usually done in
>> do_install or in special do_install_append
>> parts, but I think it would be better to handle this globally.
>
> I guess the ideal solution would be to find a way to stop libtool from
> installing these things in the first place.  It isn't totally obvious to
> me that the .la files are a net benefit even for real shared libraries,
> and for plugins I think they are probably a net loss in most/all cases.
>
> When this issue last came up it seemed that Richard's preferred fix was
> to just ship the .la files in FILES_${PN}-dev, and I guess that approach
> does at least have the merit of simplicity.  See:
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/005533.html

I see... Then I'd drop some local patches dropping .la files and just 
push them into -dev packages.

RP, is that suitable for you?

-- 
With best wishes
Dmitry



