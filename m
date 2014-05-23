Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4C266078
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 09:45:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4N9jo39019710
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 May 2014 02:45:50 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Fri, 23 May 2014 02:45:49 -0700
Message-ID: <537F18B0.6060009@windriver.com>
Date: Fri, 23 May 2014 17:45:20 +0800
From: Wenlin Kang <wenlin.kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1400833868-27473-1-git-send-email-wenlin.kang@windriver.com>
	<CAJTo0LYb9vqXFTLwEczYzafcAPv8yuo8isK00ViPvOF=YsFPsw@mail.gmail.com>
In-Reply-To: <CAJTo0LYb9vqXFTLwEczYzafcAPv8yuo8isK00ViPvOF=YsFPsw@mail.gmail.com>
X-Originating-IP: [128.224.162.182]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: fixed bash build error
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
X-List-Received-Date: Fri, 23 May 2014 09:45:51 -0000
Content-Type: multipart/alternative;
	boundary="------------020000060103000601040303"

--------------020000060103000601040303
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年05月23日 17:29, Burton, Ross wrote:
> First, bash builds fine for me, so can you elaborate on what the
> situation that causes the failure is.
  build bash, then check temp/log.do_install, we can see error , this 
trigger when builds in bash/po/
> The patch is missing upstream-status and signed-off-by.  For build
> fixes I'd hope that there would be communication with upstream.
>
> On 23 May 2014 09:31, Wenlin Kang <wenlin.kang@windriver.com> wrote:
>> +--- bash-4.3-org/aclocal.m4    2014-05-23 15:28:54.252565146 +0800
>> ++++ bash-4.3/aclocal.m4        2014-05-23 15:33:19.924570133 +0800
> aclocal.m4 is overwritten in do_configure when we run autoreconf so
> anything changed in that file will be lost.
    in bash, I have  double checking,  original a clocal.m4 will be 
"cat" to acinclude.m4 at begin of do_configure not changed,
    and  after regenerated acloacl.m4 will include acinclude.m4, so the 
changing in  original aclocal.m4 will be not lost.
>
> Ross
>
>


-- 
Thanks,
Wenlin Kang


--------------020000060103000601040303
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2014年05月23日 17:29, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYb9vqXFTLwEczYzafcAPv8yuo8isK00ViPvOF=YsFPsw@mail.gmail.com"
      type="cite">
      <pre wrap="">First, bash builds fine for me, so can you elaborate on what the
situation that causes the failure is.
</pre>
    </blockquote>
     build bash, then check temp/log.do_install, we can see error , this
    trigger when builds in bash/po/<br>
    <blockquote
cite="mid:CAJTo0LYb9vqXFTLwEczYzafcAPv8yuo8isK00ViPvOF=YsFPsw@mail.gmail.com"
      type="cite">
      <pre wrap="">
The patch is missing upstream-status and signed-off-by.  For build
fixes I'd hope that there would be communication with upstream.

On 23 May 2014 09:31, Wenlin Kang <a class="moz-txt-link-rfc2396E" href="mailto:wenlin.kang@windriver.com">&lt;wenlin.kang@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">+--- bash-4.3-org/aclocal.m4    2014-05-23 15:28:54.252565146 +0800
++++ bash-4.3/aclocal.m4        2014-05-23 15:33:19.924570133 +0800
</pre>
      </blockquote>
      <pre wrap="">
aclocal.m4 is overwritten in do_configure when we run autoreconf so
anything changed in that file will be lost.</pre>
    </blockquote>
       in bash, I have  double checking,  original a
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    clocal.m4 will be "cat" to acinclude.m4 at begin of do_configure not
    changed,<br>
       and  after regenerated acloacl.m4 will include acinclude.m4, so
    the changing in  original aclocal.m4 will be not lost.<br>
    <blockquote
cite="mid:CAJTo0LYb9vqXFTLwEczYzafcAPv8yuo8isK00ViPvOF=YsFPsw@mail.gmail.com"
      type="cite">
      <pre wrap="">

Ross


</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Wenlin Kang</pre>
  </body>
</html>

--------------020000060103000601040303--
