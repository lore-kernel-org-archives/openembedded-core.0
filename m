Return-Path: <Baogen.Shang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 467256D8FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 08:02:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0T829Bq013266
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Jan 2014 00:02:09 -0800 (PST)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 29 Jan 2014 00:02:09 -0800
Message-ID: <52E8B55F.1090006@windriver.com>
Date: Wed, 29 Jan 2014 16:01:35 +0800
From: "shang,baogen" <baogen.shang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1390808120-15299-1-git-send-email-baogen.shang@windriver.com>
	<CAJTo0La92jbGsXxHF--BBnksNm4am0X=hxeho++rPavMf2E86A@mail.gmail.com>
In-Reply-To: <CAJTo0La92jbGsXxHF--BBnksNm4am0X=hxeho++rPavMf2E86A@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs:fix build native package error
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
X-List-Received-Date: Wed, 29 Jan 2014 08:02:10 -0000
Content-Type: multipart/alternative;
	boundary="------------040609060108010905010703"

--------------040609060108010905010703
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年01月27日 18:37, Burton, Ross wrote:
> On 27 January 2014 07:35, Baogen Shang <baogen.shang@windriver.com> wrote:
>> e2fsprogs requires pkgconfig to build native package
> Presumably this is also the case for non-native builds but ordering
> ensures that pkgconfig is present?
I‘m Sorry for the title is not comprehensive, It lead to you misunderstand.
In fact,the patch also fix for non-native,Because the modify is in 
e2fsprogs.inc file.
  So it is valid for native and non-native.

Thanks,
-baogen

> Ross


--------------040609060108010905010703
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2014年01月27日 18:37, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0La92jbGsXxHF--BBnksNm4am0X=hxeho++rPavMf2E86A@mail.gmail.com"
      type="cite">
      <pre wrap="">On 27 January 2014 07:35, Baogen Shang <a class="moz-txt-link-rfc2396E" href="mailto:baogen.shang@windriver.com">&lt;baogen.shang@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">e2fsprogs requires pkgconfig to build native package
</pre>
      </blockquote>
      <pre wrap="">
Presumably this is also the case for non-native builds but ordering
ensures that pkgconfig is present?
</pre>
    </blockquote>
    I‘m Sorry for the title is not comprehensive, It lead to you
    misunderstand. <br>
    In fact,the patch also fix for non-native,Because the modify is in
    e2fsprogs.inc file.<br>
     So it is valid for native and non-native.<br>
    <br>
    Thanks,<br>
    -baogen <br>
    <br>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <blockquote
cite="mid:CAJTo0La92jbGsXxHF--BBnksNm4am0X=hxeho++rPavMf2E86A@mail.gmail.com"
      type="cite">
      <pre wrap="">
Ross
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040609060108010905010703--
