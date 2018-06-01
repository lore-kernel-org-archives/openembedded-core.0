Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 783D3608B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 04:31:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w514Uha0006597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2018 21:30:58 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 31 May 2018 21:30:32 -0700
To: Christopher Larson <kergoth@gmail.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
	<57e4cd5f6cf998b6f7b1a939c1cae2ce2a4dbdfd.1527755435.git.Qi.Chen@windriver.com>
	<CABcZANmig7C5KK_+voznmgSPF9k49VQ0Esknc8p9HUX=pMz-FA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a92a1cc5-16a7-587f-97b5-bab58900c79d@windriver.com>
Date: Fri, 1 Jun 2018 12:32:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CABcZANmig7C5KK_+voznmgSPF9k49VQ0Esknc8p9HUX=pMz-FA@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] bitbake.conf: fix HOSTTOOLS setting related to image testing
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
X-List-Received-Date: Fri, 01 Jun 2018 04:31:24 -0000
Content-Type: multipart/alternative;
	boundary="------------F58425536CEDC93D045FC9F3"

--------------F58425536CEDC93D045FC9F3
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Done.
V2 will be sent out soon.

Thanks,
Chen Qi

On 05/31/2018 10:57 PM, Christopher Larson wrote:
> While you're at it, I'd suggest fixing this to stop using the horrible 
> indexing a list with a boolean hack and use a proper inline 
> conditional. 'foo' if bar else 'baz'.
>
> On Thu, May 31, 2018 at 1:43 AM Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     A list of tools are added to HOSTTOOLS depending on if we inherit
>     testimage or not. Unfortunately, if we use TEST_IMAGE variable to
>     automate the test, these tools are not added to HOSTTOOLS.
>
>     Modify the condition to also check TEST_IMAGE to fix the above
>     problem.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      meta/conf/bitbake.conf | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>     index 6ecf78b..7b7472c 100644
>     --- a/meta/conf/bitbake.conf
>     +++ b/meta/conf/bitbake.conf
>     @@ -487,7 +487,7 @@ HOSTTOOLS += " \
>      "
>
>      # Tools needed to run testimage runtime image testing
>     -HOSTTOOLS += "${@['', 'ip ping ps scp ssh
>     stty'][bb.data.inherits_class('testimage', d)]}"
>     +HOSTTOOLS += "${@['', 'ip ping ps scp ssh
>     stty'][bb.data.inherits_class('testimage', d) or
>     d.getVar('TEST_IMAGE') == '1']}"
>
>      # Link to these if present
>      HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc
>     sftp socat ssh sudo"
>     -- 
>     1.9.1
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics



--------------F58425536CEDC93D045FC9F3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Done.<br>
      V2 will be sent out soon.<br>
      <br>
      Thanks,<br>
      Chen Qi<br>
      <br>
      On 05/31/2018 10:57 PM, Christopher Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANmig7C5KK_+voznmgSPF9k49VQ0Esknc8p9HUX=pMz-FA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">While you're at it, I'd suggest fixing this to stop
        using the horrible indexing a list with a boolean hack and use a
        proper inline conditional. 'foo' if bar else 'baz'.<br>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Thu, May 31, 2018 at 1:43 AM Chen Qi &lt;<a
            moz-do-not-send="true" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">A list of
          tools are added to HOSTTOOLS depending on if we inherit<br>
          testimage or not. Unfortunately, if we use TEST_IMAGE variable
          to<br>
          automate the test, these tools are not added to HOSTTOOLS.<br>
          <br>
          Modify the condition to also check TEST_IMAGE to fix the above
          problem.<br>
          <br>
          Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
            href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
          ---<br>
           meta/conf/bitbake.conf | 2 +-<br>
           1 file changed, 1 insertion(+), 1 deletion(-)<br>
          <br>
          diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
          index 6ecf78b..7b7472c 100644<br>
          --- a/meta/conf/bitbake.conf<br>
          +++ b/meta/conf/bitbake.conf<br>
          @@ -487,7 +487,7 @@ HOSTTOOLS += " \<br>
           "<br>
          <br>
           # Tools needed to run testimage runtime image testing<br>
          -HOSTTOOLS += <a class="moz-txt-link-rfc2396E" href="mailto:${@['','ippingpsscpsshstty'][bb.data.inherits_class('testimage',d)]}">"${@['', 'ip ping ps scp ssh
          stty'][bb.data.inherits_class('testimage', d)]}"</a><br>
          +HOSTTOOLS += <a class="moz-txt-link-rfc2396E" href="mailto:${@['','ippingpsscpsshstty'][bb.data.inherits_class('testimage',d)ord.getVar('TEST_IMAGE')=='1']}">"${@['', 'ip ping ps scp ssh
          stty'][bb.data.inherits_class('testimage', d) or
          d.getVar('TEST_IMAGE') == '1']}"</a><br>
          <br>
           # Link to these if present<br>
           HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold
          nc sftp socat ssh sudo"<br>
          -- <br>
          1.9.1<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a moz-do-not-send="true"
            href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank">Openembedded-core@lists.openembedded.org</a><br>
          <a moz-do-not-send="true"
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
      <br clear="all">
      <br>
      -- <br>
      <div dir="ltr" class="gmail_signature"
        data-smartmail="gmail_signature">
        <div dir="ltr">
          <div>
            <div dir="ltr">Christopher Larson<br>
              kergoth at gmail dot com<br>
              Founder - BitBake, OpenEmbedded, OpenZaurus<br>
              Senior Software Engineer, Mentor Graphics</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------F58425536CEDC93D045FC9F3--
