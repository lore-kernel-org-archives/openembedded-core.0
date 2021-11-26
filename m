X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Subject: Re: [OE-core] [docs] [PATCH] dev-manual: how to purge duplicate sstate cache files
References: <16B8C24F834E3318.24748@lists.openembedded.org>
 <16B8FE3872AB92F9.32206@lists.yoctoproject.org>
 <1731b51b-da96-50b2-923b-3ae95b8911d6@bootlin.com>
 <9f19c2c7-0852-013a-4568-e8af7cf60910@gmail.com>
 <12fc899c-fa56-ae7b-bc6a-759c748a1f02@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Message-ID: <59d23547-c23c-ef63-1f25-3f3f11635d49@bootlin.com>
Date: Fri, 26 Nov 2021 18:23:05 +0100
MIME-Version: 1.0
In-Reply-To: <12fc899c-fa56-ae7b-bc6a-759c748a1f02@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, Vyacheslav Yurkov <uvv.mail@gmail.com>, docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>

Hi Jacob,

Thank you for the suggestion!

On 11/26/21 10:20 AM, Jacob Kroon wrote:
> I also use the --stamps-dir method since that removes additional files.
> You just gotta remember to do a build of everything you want to keep first.


I don't understand the value of this option in the simple case when you
have a single build directory.  Here's the description of this option:

  --stamps-dir=<dir1>,<dir2>...<dirn>
        Specify the build directory's stamps directories, the sstate
        cache file which IS USED by these build diretories will be KEPT,
        other sstate cache files in cache-dir will be removed. Use ","
        as the separator. For example:
        --stamps-dir=build1/tmp/stamps,build2/tmp/stamps

What am I missing?

Thanks again

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

