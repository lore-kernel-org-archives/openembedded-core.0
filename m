X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3e2f8efd-8bca-425e-065a-33035c0f1632@bootlin.com>
Date: Tue, 28 Jun 2022 16:11:56 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] Announcing pkgexp
References: <29D9E4D8-7C19-4967-8681-0633D670B1AA@arm.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
In-Reply-To: <29D9E4D8-7C19-4967-8681-0633D670B1AA@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ross Burton <ross.burton@arm.com>, openembedded-core <openembedded-core@lists.openembedded.org>, openembeded-devel <openembedded-devel@lists.openembedded.org>, Yocto <yocto@lists.yoctoproject.org>

Hi Ross

On 6/28/22 15:36, Ross Burton wrote:
> Hi,
>
> I’ve just released the first release of pkgexp, a tool to explore the pkgdata that has been generated in a build.  Quoting from the README:
>
> pkgexp is a tool to visually explore the OpenEmbedded `pkgdata`, which is the generated package-scope metadata. Specifically, it is designed to answer common questions regarding what has been built:
>
> - What recipes have been built?
> - What packages did those packages build?
> - What files are in a specific package?
> - What other packages does this package depend on?
> - What packages depend on this package?
>
> It’s written in Python and is a local webapp (mainly because my build machine is remote, so little webapps make sense).
>
> The code is at https://gitlab.com/rossburton/pkgexp, and positive feedback is welcome.
>
> Cheers,
> Ross


Hey, this looks very nice and very easy to use!
One minor complaint, though: the "What Depends on" button didn't 
immediately catch my eye.
Would it be possible to show such reverse dependencies in the same way 
you show RDEPENDS? The result may look better and everything would be on 
the same page.

I vote for including it in the next release :-)
Many thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

