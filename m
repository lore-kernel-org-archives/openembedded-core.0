Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C6C6A6AFC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 15:00:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7LFBnSX031820; Wed, 21 Aug 2013 16:11:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XgbcK9pdgWiv; Wed, 21 Aug 2013 16:11:49 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7LFBjK2031816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 21 Aug 2013 16:11:46 +0100
Message-ID: <1377097189.25999.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laszlo Papp <lpapp@kde.org>
Date: Wed, 21 Aug 2013 15:59:49 +0100
In-Reply-To: <CAOMwXhP+k2qnhPsAEYvppC3eTf7N0UUY7V0-KVNs+83u-XU2oA@mail.gmail.com>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
	<CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
	<CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
	<CAJTo0La2UVtZ9rM-HRGY9DGzD9=D4RTZzutHT8Aks4QJ9E=zPw@mail.gmail.com>
	<CAOMwXhP6awmXzW2Sm0OMKyrWBFtQRje1CkL3yWtvzdU6fvd1bw@mail.gmail.com>
	<20130821110401.GG522@jama>
	<CAOMwXhP+k2qnhPsAEYvppC3eTf7N0UUY7V0-KVNs+83u-XU2oA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Aug 2013 15:00:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-08-21 at 12:10 +0100, Laszlo Papp wrote:
> On Wed, Aug 21, 2013 at 12:04 PM, Martin Jansa
> <martin.jansa@gmail.com> wrote:
>         On Wed, Aug 21, 2013 at 11:31:53AM +0100, Laszlo Papp wrote:
>         > That does not mean bitbake cannot generate tarball out of
>         the git
>         > repository. In fact, it is relatively simple. ;-)
>
>         It does, all you need to do is enable
>         BB_GENERATE_MIRROR_TARBALLS
>
> I am not using mirrors. I am simply pushing the downloads folder, etc
> to the git repository "git add". It is as simply as that without an
> explicit mirror set up and its maintenance.

Regardless of whether you use mirrors or not, if you set
BB_GENERATE_MIRROR_TARBALLS it will create tarballs in DL_DIR of the git
repositories. You can then stop trying to check in the /git/  and /git2/
subdirectories of DL_DIR and some of your problems will likely go away.

The reason this is not enabled by default is for performance reasons.

Cheers,

Richard


