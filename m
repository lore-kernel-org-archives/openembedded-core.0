Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7C1731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 05:08:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBM58m6E021777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Dec 2015 21:08:48 -0800 (PST)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 21 Dec 2015 21:08:48 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1447652032-31142-1-git-send-email-jian.liu@windriver.com>
	<CAJTo0LZcvVSoNnndi1qU5Pv3K5UfmpkcfRhzdQwFot6BeHrbvA@mail.gmail.com>
	<564ABBBA.5000408@windriver.com>
From: Jian Liu <jian.liu@windriver.com>
Message-ID: <5678DAD1.9070801@windriver.com>
Date: Tue, 22 Dec 2015 13:08:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <564ABBBA.5000408@windriver.com>
X-Originating-IP: [128.224.162.169]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver.bbclass: fix an exception of the mode configured
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
X-List-Received-Date: Tue, 22 Dec 2015 05:08:49 -0000
Content-Type: multipart/alternative;
	boundary="------------050700010207000203020107"

--------------050700010207000203020107
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping

On 2015年11月17日 13:31, Jian Liu wrote:
> Hi Ross,
>
> I check the values of d.getVarFlag('do_configure', 'task') and 
> d.getVarFlag('do_unpack', 'task') for gcc-source.
> But it seems that both values are 1.
>
> I use the following command to get the values,
> os.system("echo 'do_unpack=%s, do_configure=%s, noexec=%s, pn=%s' >> 
> /tmp/task.txt" %(d.getVarFlag('do_unpack', 
> 'task'),d.getVarFlag('do_configure', 
> 'task'),d.getVarFlag('do_configure', 'noexec'),pn))
>
> Does I miss something?
>
> I query several people about how to get the current tasks of a recipe. 
> But I get nothing more.
>
> Thanks!
> Jian
>
> On 2015年11月16日 23:08, Burton, Ross wrote:
>>
>> On 16 November 2015 at 05:33, Jian Liu <jian.liu@windriver.com 
>> <mailto:jian.liu@windriver.com>> wrote:
>>
>>     + if d.getVarFlag('do_configure', 'noexec') == '1' or
>>     'do_configure' not in d.getVar('__BBTASKS', False):
>>
>>
>> __BBTASKS is internal so shouldn't beused unless you have an awesome 
>> reason.  Richard tells me that d.getVarFlag('do_configure', 'task') 
>> is probably what you want.
>>
>> Ross
>
>
>


--------------050700010207000203020107
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Ping<br>
    <br>
    <div class="moz-cite-prefix">On 2015年11月17日 13:31, Jian Liu wrote:<br>
    </div>
    <blockquote cite="mid:564ABBBA.5000408@windriver.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      Hi Ross,<br>
      <br>
      I check the values of d.getVarFlag('do_configure', 'task') and
      d.getVarFlag('do_unpack', 'task') for gcc-source.<br>
      But it seems that both values are 1.<br>
      <br>
      I use the following command to get the values,<br>
      os.system("echo 'do_unpack=%s, do_configure=%s, noexec=%s, pn=%s'
      &gt;&gt; /tmp/task.txt" %(d.getVarFlag('do_unpack',
      'task'),d.getVarFlag('do_configure',
      'task'),d.getVarFlag('do_configure', 'noexec'),pn))<br>
      <br>
      Does I miss something?<br>
      <br>
      I query several people about how to get the current tasks of a
      recipe. But I get nothing more.<br>
      <br>
      Thanks!<br>
      Jian<br>
      <br>
      <div class="moz-cite-prefix">On 2015年11月16日 23:08, Burton, Ross
        wrote:<br>
      </div>
      <blockquote
cite="mid:CAJTo0LZcvVSoNnndi1qU5Pv3K5UfmpkcfRhzdQwFot6BeHrbvA@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div class="gmail_extra"><br>
            <div class="gmail_quote">On 16 November 2015 at 05:33, Jian
              Liu <span dir="ltr">&lt;<a moz-do-not-send="true"
                  href="mailto:jian.liu@windriver.com" target="_blank">jian.liu@windriver.com</a>&gt;</span>
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                <div id=":3d3" class="" style="overflow:hidden">+       
                  if d.getVarFlag('do_configure', 'noexec') == '1' or
                  'do_configure' not in d.getVar('__BBTASKS', False):<br>
                </div>
              </blockquote>
            </div>
            <br>
            __BBTASKS is internal so shouldn't beused unless you have an
            awesome reason.  Richard tells me that
            d.getVarFlag('do_configure', 'task') is probably what you
            want.</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">Ross</div>
        </div>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------050700010207000203020107--
