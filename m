Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2A22C78596
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 23:51:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Nov 2017 15:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,449,1505804400"; d="scan'208,217";a="6062043"
Received: from davidsol-mobl.amr.corp.intel.com (HELO [10.252.250.52])
	([10.252.250.52])
	by orsmga003.jf.intel.com with ESMTP; 24 Nov 2017 15:51:20 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
	<0bddac7569ccd37263ce4d59d0ec3c4e2787246f.1508360667.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LbTSY6w1+K8tCoyh0MpSG2H+_AA0B+P-DHgZHxz7m1s9A@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <7079b2e6-b0e8-7882-9b7a-e8bafd94f78c@linux.intel.com>
Date: Fri, 24 Nov 2017 17:51:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbTSY6w1+K8tCoyh0MpSG2H+_AA0B+P-DHgZHxz7m1s9A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Fri, 24 Nov 2017 23:51:21 -0000
Content-Type: multipart/alternative;
	boundary="------------5E28D6E9B447CF8958B9FD08"
Content-Language: en-US

--------------5E28D6E9B447CF8958B9FD08
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Ross,


Yeah sorry, at first I didnt realize why we needed the manifest for 
python native, I will fix the commit message.


Thanks!


Alejandro


On 11/24/2017 11:06 AM, Burton, Ross wrote:
> On 18 October 2017 at 22:07, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>      - Removes the manifest from the python-native recipe (Why was it
>     there
>        in the first place?, native recipes do not get split).
>
>
> Was this commit written before you added manifest support to 
> python-native?  :)  python-native needs the manifest to set RPROVIDES 
> so that dependencies work.  Can you update the message? (just deleting 
> this line will do)
>
> Ross


--------------5E28D6E9B447CF8958B9FD08
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Ross,</p>
    <p><br>
    </p>
    <p>Yeah sorry, at first I didnt realize why we needed the manifest
      for python native, I will fix the commit message.</p>
    <p><br>
    </p>
    <p>Thanks!</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/24/2017 11:06 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LbTSY6w1+K8tCoyh0MpSG2H+_AA0B+P-DHgZHxz7m1s9A@mail.gmail.com">
      <div dir="ltr">On 18 October 2017 at 22:07, Alejandro Hernandez <span
          dir="ltr">&lt;<a
            href="mailto:alejandro.hernandez@linux.intel.com"
            target="_blank" moz-do-not-send="true">alejandro.hernandez@linux.intel.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"> -
              Removes the manifest from the python-native recipe (Why
              was it there<br>
                 in the first place?, native recipes do not get split).<br>
            </blockquote>
            <div><br>
            </div>
            <div>Was this commit written before you added manifest
              support to python-native?  :)  python-native needs the
              manifest to set RPROVIDES so that dependencies work.  Can
              you update the message? (just deleting this line will do)</div>
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------5E28D6E9B447CF8958B9FD08--
