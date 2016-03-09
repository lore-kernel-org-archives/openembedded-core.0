Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 996176E666
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 01:07:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2917IiH016185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 8 Mar 2016 17:07:18 -0800
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Mar 2016 17:07:17 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1456449257.git.hongxu.jia@windriver.com>
	<05c06ed8ffad83ab3bf492ef793f33f2a5d346e3.1456449257.git.hongxu.jia@windriver.com>
	<CAJTo0LYNcQTcB9tLgYO0gRak4cLV3feaQJGautCBFyxVTQwBaQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56DF7739.4000103@windriver.com>
Date: Wed, 9 Mar 2016 09:07:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYNcQTcB9tLgYO0gRak4cLV3feaQJGautCBFyxVTQwBaQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/15] python-pygobject: fix buildpath QA issue
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
X-List-Received-Date: Wed, 09 Mar 2016 01:07:21 -0000
Content-Type: multipart/alternative;
	boundary="------------000300030609040502010205"

--------------000300030609040502010205
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2016 11:24 PM, Burton, Ross wrote:
>
> On 26 February 2016 at 01:45, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     +do_install_append_class-target() {
>     +       sed -i -e "s:${PYTHON}:\`which python\`:g" \
>     +           ${D}${bindir}/pygobject-codegen-2.0
>     +}
>
>
> If you're going to expect the shell to find the right python on the 
> target there's no need to use `which python` as exec will search 
> $PATH.  However, we do know where Python on the target it: 
> ${bindir}/python.
>

OK, I directly use '${bindir}/python' to instead.

//Hongxu

> Ross


--------------000300030609040502010205
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/08/2016 11:24 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYNcQTcB9tLgYO0gRak4cLV3feaQJGautCBFyxVTQwBaQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 26 February 2016 at 01:45, Hongxu
            Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":5h4" class="a3s" style="overflow:hidden">+do_install_append_class-target()
                {<br>
                +       sed -i -e "s:${PYTHON}:\`which python\`:g" \<br>
                +           ${D}${bindir}/pygobject-codegen-2.0<br>
                +}</div>
            </blockquote>
          </div>
          <br>
          If you're going to expect the shell to find the right python
          on the target there's no need to use `which python` as exec
          will search $PATH.  However, we do know where Python on the
          target it: ${bindir}/python.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    OK, I directly use '${bindir}/python' to instead.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LYNcQTcB9tLgYO0gRak4cLV3feaQJGautCBFyxVTQwBaQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000300030609040502010205--
