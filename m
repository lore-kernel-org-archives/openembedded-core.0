Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SfXc9-0006vO-MZ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 16:35:05 +0200
Received: from [192.168.0.41] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 32F906005D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 14:27:06 +0100 (BST)
Message-ID: <4FDB4476.2070105@communistcode.co.uk>
Date: Fri, 15 Jun 2012 15:19:34 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20120615063647.GU3140@jama.jama.net>
	<CAMKF1srmOijugSfqfOivt2Sqfi0CvUVfZDRgUCprSShJ4nzf_w@mail.gmail.com>
In-Reply-To: <CAMKF1srmOijugSfqfOivt2Sqfi0CvUVfZDRgUCprSShJ4nzf_w@mail.gmail.com>
Subject: Re: openssl does not build on recent distributions with perl-5.16.0
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
X-List-Received-Date: Fri, 15 Jun 2012 14:35:06 -0000
Content-Type: multipart/alternative;
	boundary="------------050100030901050006080502"

--------------050100030901050006080502
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 15/06/12 15:15, Khem Raj wrote:
>
>
> On Thursday, June 14, 2012, Martin Jansa wrote:
>
>     Hi,
>
>     openembedded-core/meta/recipes-connectivity/openssl/openssl.inc
>
>     is using perlpath.pl <http://perlpath.pl>:
>
>      do_configure () {
>              cd util
>              perl perlpath.pl <http://perlpath.pl>
>     ${STAGING_BINDIR_NATIVE}
>
>
> I wonder why it's using host perl and not staged perl-native
> May be missing inherit perlnative
>
>      ...
>
>     and perlpath.pl <http://perlpath.pl> is using find.pl
>     <http://find.pl>:
>     openssl-1.0.0i/util/perlpath.pl <http://perlpath.pl>:
>      #!/usr/local/bin/perl
>      #
>      # modify the '#!/usr/local/bin/perl'
>      # line in all scripts that rely on perl.
>      #
>
>      require "find.pl <http://find.pl>";
>      ...
>
>     which was removed in perl-5.16.0 and marked as deprecated and
>     unmaintained in 5.14 and older:
>     /tmp/usr/lib/perl5/5.14.2/find.pl <http://find.pl>:
>      warn "Legacy library @{[(caller(0))[6]]} will be removed from the
>     Perl
>      core distribution in the next major release. Please install it
>     from the
>      CPAN distribution Perl4::CoreLibs. It is being used at
>     @{[(caller)[1]]},
>      line @{[(caller)[2]]}.\n";
>
>      # This library is deprecated and unmaintained. It is included for
>      # compatibility with Perl 4 scripts which may use it, but it will be
>      # removed in a future version of Perl. Please use the File::Find
>     module
>      # instead.
>
>     Cheers,
>
>     --
>     Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com <javascript:;>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

I can confirm I also ran into this issue using Archlinux, I thought it 
was an issue with my Perl install but obviously not!

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------050100030901050006080502
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 15/06/12 15:15, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1srmOijugSfqfOivt2Sqfi0CvUVfZDRgUCprSShJ4nzf_w@mail.gmail.com"
      type="cite"><br>
      <br>
      On Thursday, June 14, 2012, Martin Jansa wrote:<br>
      <blockquote class="gmail_quote" style="margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
        <br>
        openembedded-core/meta/recipes-connectivity/openssl/openssl.inc<br>
        <br>
        is using <a moz-do-not-send="true" href="http://perlpath.pl"
          target="_blank">perlpath.pl</a>:<br>
        <br>
        &nbsp;do_configure () {<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cd util<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;perl <a moz-do-not-send="true"
          href="http://perlpath.pl" target="_blank">perlpath.pl</a>
        ${STAGING_BINDIR_NATIVE}</blockquote>
      <div><br>
      </div>
      <div>I wonder why it's using host perl and not staged perl-native</div>
      <div>May be missing inherit perlnative&nbsp;<span></span></div>
      <blockquote class="gmail_quote" style="margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex"> &nbsp;...<br>
        <br>
        and <a moz-do-not-send="true" href="http://perlpath.pl"
          target="_blank">perlpath.pl</a> is using <a
          moz-do-not-send="true" href="http://find.pl" target="_blank">find.pl</a>:<br>
        openssl-1.0.0i/util/<a moz-do-not-send="true"
          href="http://perlpath.pl" target="_blank">perlpath.pl</a>:<br>
        &nbsp;#!/usr/local/bin/perl<br>
        &nbsp;#<br>
        &nbsp;# modify the '#!/usr/local/bin/perl'<br>
        &nbsp;# line in all scripts that rely on perl.<br>
        &nbsp;#<br>
        <br>
        &nbsp;require "<a moz-do-not-send="true" href="http://find.pl"
          target="_blank">find.pl</a>";<br>
        &nbsp;...<br>
        <br>
        which was removed in perl-5.16.0 and marked as deprecated and<br>
        unmaintained in 5.14 and older:<br>
        /tmp/usr/lib/perl5/5.14.2/<a moz-do-not-send="true"
          href="http://find.pl" target="_blank">find.pl</a>:<br>
        &nbsp;warn "Legacy library @{[(caller(0))[6]]} will be removed from
        the Perl<br>
        &nbsp;core distribution in the next major release. Please install it
        from the<br>
        &nbsp;CPAN distribution Perl4::CoreLibs. It is being used at
        @{[(caller)[1]]},<br>
        &nbsp;line @{[(caller)[2]]}.\n";<br>
        <br>
        &nbsp;# This library is deprecated and unmaintained. It is included
        for<br>
        &nbsp;# compatibility with Perl 4 scripts which may use it, but it
        will be<br>
        &nbsp;# removed in a future version of Perl. Please use the
        File::Find module<br>
        &nbsp;# instead.<br>
        <br>
        Cheers,<br>
        <br>
        --<br>
        Martin 'JaMa' Jansa &nbsp; &nbsp; jabber: <a moz-do-not-send="true"
          href="javascript:;" onclick="_e(event, 'cvml',
          'Martin.Jansa@gmail.com')">Martin.Jansa@gmail.com</a><br>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <tt><br>
      I can confirm I also ran into this issue using Archlinux, I
      thought it was an issue with my Perl install but obviously not!<br>
      <br>
      Regards, </tt><br>
    <pre class="moz-signature" cols="72">-- 

  Jack Mitchell (<a class="moz-txt-link-abbreviated" href="mailto:jack@embed.me.uk">jack@embed.me.uk</a>)             
  Embedded Systems Engineer
  <a class="moz-txt-link-freetext" href="http://www.embed.me.uk">http://www.embed.me.uk</a>

--
</pre>
  </body>
</html>

--------------050100030901050006080502--
