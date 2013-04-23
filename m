Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UUdvm-0001tD-G8 for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 16:10:53 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3NDs06Y010258; Tue, 23 Apr 2013 14:54:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SynKGkSNLJyO; Tue, 23 Apr 2013 14:54:00 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3NDrr3A010249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 23 Apr 2013 14:53:54 +0100
Message-ID: <1366725166.23738.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2013 14:52:46 +0100
In-Reply-To: <CAJTo0LZsrvMLioXtKtZHmnRExnLVOqy9QmHOXUKJLEKNP4fXzw@mail.gmail.com>
References: <1366708403-45429-1-git-send-email-kirgene@gmail.com>
	<CAJTo0LZsrvMLioXtKtZHmnRExnLVOqy9QmHOXUKJLEKNP4fXzw@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Yevhen Kyriukha <kirgene@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] systemd: added python-systemd package generation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2013 14:10:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-23 at 14:41 +0100, Burton, Ross wrote:
> On 23 April 2013 10:13, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> > +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives pythonnative python-dir
> 
> Does this really need pythonnative?  That's adding a python-native
> dependency to build systemd.

To handle python modules correctly, I suspect the answer is yes. It
would be better if we could make this inherit conditional somehow. I'm
also sceptical about the separate -dev/=dbg packages for the python
pieces, this isn't the standard practise.

Cheers,

Richard



