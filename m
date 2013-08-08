Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70FB06AF12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 11:06:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r78B6hsD011174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2013 04:06:43 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 8 Aug 2013 04:06:41 -0700
Message-ID: <52037BBF.1030600@windriver.com>
Date: Thu, 8 Aug 2013 19:06:39 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
	<9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
	<CAJTo0LZgSV7RRPE6qjNp9fkRD9abiWoW6teRdYq2zBXEWdcmew@mail.gmail.com>
In-Reply-To: <CAJTo0LZgSV7RRPE6qjNp9fkRD9abiWoW6teRdYq2zBXEWdcmew@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libdbm-sqlite-perl: add version 1.40
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
X-List-Received-Date: Thu, 08 Aug 2013 11:06:44 -0000
Content-Type: multipart/alternative;
	boundary="------------050300060605000702070900"

--------------050300060605000702070900
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2013 06:43 PM, Burton, Ross wrote:
> On 8 August 2013 10:01, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> DBD::SQLite is a Perl DBI driver for SQLite, that includes the entire
>> thing in the distribution. So in order to get a fast transaction capable
>> RDBMS working for your perl project you simply have to install this
>> module, and nothing else.
> What's the rationale for putting this into oe-core, verses meta-oe or
> even starting a meta-perl?
It seems DBI is a commonly-used perl database support package,
and work with multiple DBDs, the DBD::driver is based on actual
database. We get sqlite in oe-core, so put them in oe-core.

//Hongxu
> Ross


--------------050300060605000702070900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/08/2013 06:43 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZgSV7RRPE6qjNp9fkRD9abiWoW6teRdYq2zBXEWdcmew@mail.gmail.com"
      type="cite">
      <pre wrap="">On 8 August 2013 10:01, Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">DBD::SQLite is a Perl DBI driver for SQLite, that includes the entire
thing in the distribution. So in order to get a fast transaction capable
RDBMS working for your perl project you simply have to install this
module, and nothing else.
</pre>
      </blockquote>
      <pre wrap="">
What's the rationale for putting this into oe-core, verses meta-oe or
even starting a meta-perl?
</pre>
    </blockquote>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    It seems DBI is a commonly-used perl database support package,<br>
    and work with multiple DBDs, the DBD::driver is based on actual<br>
    database. We get sqlite in oe-core, so put them in oe-core.<br>
    <br>
    //Hongxu<br>
    <blockquote
cite="mid:CAJTo0LZgSV7RRPE6qjNp9fkRD9abiWoW6teRdYq2zBXEWdcmew@mail.gmail.com"
      type="cite">
      <pre wrap="">
Ross
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------050300060605000702070900--
