Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RuMrP-0006hR-Gl
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 12:35:52 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RuMjg-000589-L5
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 12:27:52 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Feb 2012 11:27:51 +0000
In-Reply-To: <CAP9ODKrFuJ85mcXS6DAJxagFrgonWv+jTCUUQibx3Ug85BOCVw@mail.gmail.com>
References: <cover.1328526202.git.otavio@ossystems.com.br>
	<5ffae3864d6ec5dafadff13381d3177c44392b7e.1328526202.git.otavio@ossystems.com.br>
	<1328526818.14363.2.camel@phil-desktop>
	<CAP9ODKrFuJ85mcXS6DAJxagFrgonWv+jTCUUQibx3Ug85BOCVw@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328527672.14363.3.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Mon, 06 Feb 2012 11:35:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-02-06 at 09:21 -0200, Otavio Salvador wrote:
> On Mon, Feb 6, 2012 at 09:13, Phil Blundell <philb@gnu.org> wrote:
>         On Mon, 2012-02-06 at 11:03 +0000, Otavio Salvador wrote:
>         > +pkg_postrm_dhcp-server() {
>         > +    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
>         > +    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
>         > +    rmdir $D/${localstatedir}/lib/dhcp
>         > +}
>         > +
>         > +pkg_postrm_dhcp-client() {
>         > +    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
>         > +    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
>         > +    rmdir $D/${localstatedir}/lib/dhcp
>         
>         
>         Are those rmdirs not going to fail if you try to remove one
>         package with
>         the other one still installed?
> 
> 
> I think they will. I'll add an || true on it.

If you do that then you'd also need to redirect stderr to avoid getting
error messages on the console.  Might be better to wrap the rmdir calls
in a check to see if the directory is empty.

p.





