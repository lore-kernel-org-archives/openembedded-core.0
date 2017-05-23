Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2CF9719B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 10:00:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4NA0B9o027971
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 23 May 2017 03:00:13 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 23 May 2017 03:00:09 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1495183828.git.kai.kang@windriver.com>
	<d0db7f059097d0271e5808dda280140ef49aae6f.1495183828.git.kai.kang@windriver.com>
	<CAJTo0LbxO83ka-W2znsakpTwOejgoJzmxFuehogFk5oDhZct2Q@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <c46b6cd7-cf25-8fd6-789f-c9cfbcbf9026@windriver.com>
Date: Tue, 23 May 2017 17:58:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbxO83ka-W2znsakpTwOejgoJzmxFuehogFk5oDhZct2Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bind: build with threads and update configure options
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
X-List-Received-Date: Tue, 23 May 2017 10:00:15 -0000
Content-Type: multipart/alternative;
	boundary="------------DE360297AC560BB85834B73E"
Content-Language: en-US

--------------DE360297AC560BB85834B73E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年05月19日 19:47, Burton, Ross wrote:
>
> On 19 May 2017 at 09:52, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     Build without threads for bind is inherited from legacy openembedded.
>     All libc's support proper threading on Linux now, so enable threads
>     support for bind.
>
>     It is also need to disable static library build which cause
>     package dhcp
>     fail to build after enable bind threads support.
>
>     Options devpoll and epoll are configured to choose most preferable
>     multiplex method for unix socket. The priorities are: epoll > poll >
>     select. When set '--enable-epoll', it just defines a var and include
>     header file that is available for cross compile. So use epoll for
>     bind.
>
>     Add PACKAGECONFIG 'urandom' that could use /dev/urandom as random
>     device.
>
>     Update file/directory ownerships to fix daemon start failure.
>
>
> This is changing more than documented:
>
> packages/corei7-64-poky-linux/bind/bind-utils: RDEPENDS: removed 
> "libcrypto (['>= 1.0.2k'])", added "bind (['>= 9.10.3-P3'])"

It is a problem and I am still working to figure it out.

Thanks,
Kai

>
> (and dhcp has the same dropping of libcrypto)
>
> Is this intentional?
>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------DE360297AC560BB85834B73E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年05月19日 19:47, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LbxO83ka-W2znsakpTwOejgoJzmxFuehogFk5oDhZct2Q@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 May 2017 at 09:52, <span
              dir="ltr">&lt;<a href="mailto:kai.kang@windriver.com"
                target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
              <div id="gmail-:2bt" class="gmail-a3s gmail-aXjCH
                gmail-m15c1fed202a4f4a4">Build without threads for <span
                  class="gmail-il">bind</span> is inherited from legacy
                openembedded.<br>
                All libc's support proper threading on Linux now, so
                enable threads<br>
                support for <span class="gmail-il">bind</span>.<br>
                <br>
                It is also need to disable static library build which
                cause package dhcp<br>
                fail to build after enable <span class="gmail-il">bind</span>
                threads support.<br>
                <br>
                Options devpoll and epoll are configured to choose most
                preferable<br>
                multiplex method for unix socket. The priorities are:
                epoll &gt; poll &gt;<br>
                select. When set '--enable-epoll', it just defines a var
                and include<br>
                header file that is available for cross compile. So use
                epoll for <span class="gmail-il">bind</span>.<br>
                <br>
                Add PACKAGECONFIG 'urandom' that could use /dev/urandom
                as random device.<br>
                <br>
                Update file/directory ownerships to fix daemon start
                failure.</div>
            </blockquote>
          </div>
          <br>
          This is changing more than documented:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">packages/corei7-64-poky-linux/bind/bind-utils:
          RDEPENDS: removed "libcrypto (['&gt;= 1.0.2k'])", added "bind
          (['&gt;= 9.10.3-P3'])"<br>
        </div>
      </div>
    </blockquote>
    <br>
    It is a problem and I am still working to figure it out.<br>
    <br>
    Thanks,<br>
    Kai<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LbxO83ka-W2znsakpTwOejgoJzmxFuehogFk5oDhZct2Q@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">(and dhcp has the same dropping of
          libcrypto)</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Is this intentional?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------DE360297AC560BB85834B73E--
