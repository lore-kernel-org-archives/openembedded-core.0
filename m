Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EFB0D70018
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 19:23:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2016 11:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,533,1449561600"; 
	d="scan'208,217";a="900616240"
Received: from akaringa-mobl2.amr.corp.intel.com (HELO [10.254.102.15])
	([10.254.102.15])
	by orsmga001.jf.intel.com with ESMTP; 03 Mar 2016 11:23:55 -0800
To: "Burton, Ross" <ross.burton@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>
References: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
	<20160303153659.GG2569@jama>
	<CAJTo0LaEvWh1rgR77i7MQ-zZQOKBF1GNkQyOFHtJHo0HN_YuXQ@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <56D88F99.1070400@linux.intel.com>
Date: Thu, 3 Mar 2016 13:25:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaEvWh1rgR77i7MQ-zZQOKBF1GNkQyOFHtJHo0HN_YuXQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Replaces udev with eudev for compatibility when using sysvinit on newer kernels
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
X-List-Received-Date: Thu, 03 Mar 2016 19:23:57 -0000
Content-Type: multipart/alternative;
	boundary="------------080000030000050206040900"

--------------080000030000050206040900
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 03/03/2016 10:27 AM, Burton, Ross wrote:
>
> On 3 March 2016 at 15:36, Martin Jansa <martin.jansa@gmail.com 
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     is it expected that old udev package was only 0.5MB, eudev is 6MB?
>
>     Most of it is probably caused by /etc/udev/hwdb.d
>
>
> Ouch!
>
> Following systemd, that should be split out into a separate package.  
> Alejandro, can you do this?
>
> Ross

Wow!, sure I'll take a look and split it

Alejandro

--------------080000030000050206040900
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 03/03/2016 10:27 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaEvWh1rgR77i7MQ-zZQOKBF1GNkQyOFHtJHo0HN_YuXQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 3 March 2016 at 15:36, Martin
            Jansa <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:martin.jansa@gmail.com" target="_blank">martin.jansa@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2u1" class="a3s" style="overflow:hidden">is it
                expected that old udev package was only 0.5MB, eudev is
                6MB?<br>
                <br>
                Most of it is probably caused by /etc/udev/hwdb.d<br>
              </div>
            </blockquote>
          </div>
          <br>
          Ouch!</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Following systemd, that should be split
          out into a separate package.  Alejandro, can you do this?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    Wow!, sure I'll take a look and split it<br>
    <br>
    Alejandro<br>
  </body>
</html>

--------------080000030000050206040900--
