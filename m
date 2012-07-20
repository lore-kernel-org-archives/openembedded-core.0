Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SsDt6-00080D-VU
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 16:09:01 +0200
Received: by lbol5 with SMTP id l5so4920837lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=Pz+52rAgVxzBYbn/K2bLd04yx6WR5Wiw06uKXQ1prP8=;
	b=cyrvglrdbjZvwIT+JMSM1e/J7i+abDMbXzH6ZF+3ZiKNqevHpKoxGk1hKVqF5nT/Ro
	sjDf5WCwpW/19+OCzj4LPeXWsDgFy+SfvfI6q0KXc4wszy+QPPerddeRd6dCmEh8ex94
	4fxxzO34BAUi90XCNifUhgQLouqeXzshiZb7cO0jh95nzNB9ORIK1I0A2H1/J5RG8RZG
	LQtYvjqq1/wgH1kI0bYy+zFTSfd9WyVlKimFkO7KgGFbu3hGr0H29FTrvB/BPRTJJstH
	snJzCcrlw54rHG3TkuNnmO9V7J348EeYYKDP+ESLlccvaJsaiVQDXi1tZdeIG1QZsjM+
	Rj1Q==
Received: by 10.152.127.98 with SMTP id nf2mr6596474lab.4.1342792657783; Fri,
	20 Jul 2012 06:57:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Fri, 20 Jul 2012 06:57:17 -0700 (PDT)
In-Reply-To: <1342792561.21788.17.camel@ted>
References: <20120720093208.GD3534@jama.jama.net>
	<1342792561.21788.17.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 20 Jul 2012 06:57:17 -0700
X-Google-Sender-Auth: 9Er8AQ_r2HbpOB3kPIc7CA67SCw
Message-ID: <CABcZANkMioYyrY-+eMbkT5Dbsfs5LJEJQaHj31mgv8jd0Z2qiw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto style guide change proposal
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
X-List-Received-Date: Fri, 20 Jul 2012 14:09:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 20, 2012 at 6:56 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-07-20 at 11:32 +0200, Martin Jansa wrote:
>> Now we have horrible mixture of whitespaces (tabs and space) only in
>> recipe files, because yocto style guide recommends tabs in shell
>> functions. So if recipe has e.g. do_install_append as well as
>> populate_packages_prepend (not so uncommon combination as tabs fixing
>> patches show), then according to yocto style guide it should look like
>> this:
>>
>> do_install_append() {
>>       foo
>> }
>> python populate_packages_prepend () {
>>     libdir = bb.data.expand('${libdir}', d)
>>     do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
>> }
>>
>> especially with default tab width 8 spaces it's ugly and because it
>> is inconsistent, many devs used spaces in shell functions too. Now when
>> someone accidentaly use tab also in python function it will show warning
>> or fail to parse. Some devs are using mix of tabs and spaces even on the
>> same line (e.g. to indent SRC_URI multiline entries).
>
> We've said tabs for shell functions for *years*. I'm sure if I were to
> look at the mailing list archives, that would be clear.
>
> In summary, I agree we need to make the style guides consistent and have
> one version of them. I disagree with spaces for everything though,m
> particularly as we have said to use tabs for as long and many of the
> recipes do this (certainly more than use spaces).

I don't think history is a particularly good reason to keep our
metadata inconsistent, especially with bitbake becoming picky about
it.
-- 
Christopher Larson


