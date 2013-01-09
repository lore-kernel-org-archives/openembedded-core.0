Received: from mail-ie0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TstM2-0005C1-NU
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 11:57:55 +0100
Received: by mail-ie0-f179.google.com with SMTP id k14so1831718iea.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 02:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9Weo6G3nptAtqfws7hDjfWoPGhlW44UVdl3L06xNg/c=;
	b=m3ugnj5wPF8v9PyEbVBljxTfj/KZm4zgkNBok6dARrkI0/TNv7pyE98Mxzx++3VGHd
	6aF7Mcqjn4WlzMyAWReiFjmyqmKwk60ZqdF5NpD7y2vBoM77cY0Jgn08/P2THazdWGl+
	OGMT8VjQdkW54Rx1wT8rFy2fXEoF4J7/nisljCSaz2D2vagz30vKVNBV7N87pwqcb2T2
	FtRqeC1KxJL2Dshz3KCdpPLu7/fUhwJSivOdhN1rcgBp3B3C9WMQj4k263unIPSlMKJv
	0aJG/VdDp839qIEPTonbmdd6A9/mSTlrLeAu5O2ffeQgx6E/dEB5FQpnkeHcXQBFg5ie
	gjfw==
MIME-Version: 1.0
Received: by 10.50.42.167 with SMTP id p7mr1047430igl.7.1357728162464; Wed, 09
	Jan 2013 02:42:42 -0800 (PST)
Received: by 10.42.167.196 with HTTP; Wed, 9 Jan 2013 02:42:42 -0800 (PST)
In-Reply-To: <20130109102910.GF3722@jama.palm1.palmone.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
	<50E8FDBB.5080500@linux.intel.com>
	<CAF6bG8fBgAP_No6RkckjvEQ2XquwKagbyn-Rh01CY7Hi+8MfFw@mail.gmail.com>
	<CAF6bG8cuLp7nGzKUZscUrRoa1Z5_mrSduvWQ4r4YbvtZx2rFdg@mail.gmail.com>
	<20130109091303.GC3722@jama.palm1.palmone.com>
	<CAF6bG8dULrN_qQZWjvM2mJgQbyn0UvqzhcjV7e6Rzfj3h9GX4g@mail.gmail.com>
	<388BD596D68348D5A465A83C5E148D40@intel.com>
	<CAF6bG8evo8qRJ8hmORNVQ0GFQUDC48G0=Uj9KxDcKtyt_2U_qw@mail.gmail.com>
	<20130109102910.GF3722@jama.palm1.palmone.com>
Date: Wed, 9 Jan 2013 12:42:42 +0200
Message-ID: <CAF6bG8ftFQMertGrdbwnEZNhK0kB1_zdRm=3+uOuyQ6CkBZB-Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Wed, 09 Jan 2013 10:57:55 -0000
Content-Type: text/plain; charset=UTF-8

On 9 January 2013 12:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jan 09, 2013 at 12:00:20PM +0200, Marko Lindqvist wrote:
>> On 9 January 2013 11:42, Ross Burton <ross.burton@intel.com> wrote:
>> > On Wednesday, 9 January 2013 at 09:33, Marko Lindqvist wrote:
>> >> Exactly, except that it would be provided by bitbake, and not
>> >> constructed by each recipe itself - less recipe writing work + you
>> >> could count on it to always mean same thing.
>> >
>> > Everything but the last dot, or the first two components, or what?  For anything GNOMEy you want the first two elements as some packages use nano releases for development snapshots (1.2.3.4).
>>
>>  Ok, do we have any counter-examples where you'd want, say, three out
>> of four parts? One out of n? Of course there will always be need to
>> use variables of their own in some recipes, but I'm after something
>> that would be usable in most cases.
>
> I don't remember where but 1st of 4 is also used.
> What about stuff like "1.2.3.4+gitAUTOINC"?
>
> GNOME is quite consistent, but it still looks better defined in
> recipe/bbclass then having "something" defined by bitbake in all recipes
> and usable only in some.

 Given the examples, yes. Only if external tools would benefit (=
could use bitbake defined, but not recipe constructed var), defining
it bitbake side would make sense.


 - ML


