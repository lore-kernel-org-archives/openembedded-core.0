Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 586896FFEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:12:27 +0000 (UTC)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <5c4588bd-53f6-6086-0443-faed9c0732cc@embed.me.uk>
	<CAJTo0LY4eFrus=dOy4PzbauML6iz4qzpCKrw9rp-pLCy6YiscQ@mail.gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <1c31ec07-55d1-3a33-fc5f-6047c940d950@embed.me.uk>
Date: Tue, 22 Nov 2016 15:11:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY4eFrus=dOy4PzbauML6iz4qzpCKrw9rp-pLCy6YiscQ@mail.gmail.com>
Subject: Re: distro checking and lsb_release
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
X-List-Received-Date: Tue, 22 Nov 2016 15:12:29 -0000
Content-Type: multipart/alternative;
	boundary="------------EB1E8E27B7A7CC996ED8E0E5"

--------------EB1E8E27B7A7CC996ED8E0E5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 22/11/16 14:25, Burton, Ross wrote:

>
> On 22 November 2016 at 14:07, Jack Mitchell <ml@embed.me.uk
> <mailto:ml@embed.me.uk>>wrote:
>
>     With the recent changes to distro checking the lsb_release binary
>     is now
>     required. I tried adding this to SANITY_REQUIRED_UTILITIES however it
>     seems as though the distro check is done before the SanityEvent is
>     triggered. Where would be the best place to check this binary is
>     available to prevent an ugly python traceback?
>
>
> It shouldn't be required at all.  What error are you getting?

You can also run generated qemu images with a command like 'runqemu qemux86'
ERROR: Execution of event handler 'base_eventhandler' failed
Traceback (most recent call last):
  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/classes/base.bbclass",
line 214, in base_eventhandler(e=<bb.event.ConfigParsed object at
0x7fb511f75438>):
             if not e.data.getVar("NATIVELSBSTRING", False):
    >            e.data.setVar("NATIVELSBSTRING",
lsb_distro_identifier(e.data))
             e.data.setVar('BB_VERSION', bb.__version__)
  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/classes/base.bbclass",
line 47, in lsb_distro_identifier(d=<bb.data_smart.DataSmart object at
0x7fb5124079b0>):
                 pass
    >    return oe.lsb.distro_identifier(adjust_func)
    
  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/lib/oe/lsb.py",
line 99, in distro_identifier(adjust_hook=None):
    
    >    distro_id = distro_data['DISTRIB_ID']
         release = distro_data['DISTRIB_RELEASE']
TypeError: 'NoneType' object is not subscriptable

ERROR: Error parsing configuration files
Traceback (most recent call last):
  File
"/home/jack/work/build/build-build/openembedded/bitbake.git/lib/bb/event.py",
line 124, in fire_class_handlers(event=<bb.event.ConfigParsed object at
0x7fb511f75438>, d=<bb.data_smart.DataSmart object at 0x7fb5124079b0>):
                         continue
    >            execute_handler(name, handler, event, d)
    
  File
"/home/jack/work/build/build-build/openembedded/bitbake.git/lib/bb/event.py",
line 96, in execute_handler(name='base_eventhandler', handler=<function
base_eventhandler at 0x7fb511fd02f0>, event=<bb.event.ConfigParsed
object at 0x7fb511f75438>, d=<bb.data_smart.DataSmart object at
0x7fb5124079b0>):
         try:
    >        ret = handler(event)
         except (bb.parse.SkipRecipe, bb.BBHandledException):
  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/classes/base.bbclass",
line 214, in base_eventhandler(e=<bb.event.ConfigParsed object at
0x7fb511f75438>):
             if not e.data.getVar("NATIVELSBSTRING", False):
    >            e.data.setVar("NATIVELSBSTRING",
lsb_distro_identifier(e.data))
             e.data.setVar('BB_VERSION', bb.__version__)
  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/classes/base.bbclass",
line 47, in lsb_distro_identifier(d=<bb.data_smart.DataSmart object at
0x7fb5124079b0>):
                 pass
    >    return oe.lsb.distro_identifier(adjust_func)
    
  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/lib/oe/lsb.py",
line 99, in distro_identifier(adjust_hook=None):
    
    >    distro_id = distro_data['DISTRIB_ID']
         release = distro_data['DISTRIB_RELEASE']
TypeError: 'NoneType' object is not subscriptable



--------------EB1E8E27B7A7CC996ED8E0E5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><tt>On 22/11/16 14:25, Burton, Ross wrote:</tt><tt><br>
      </tt></p>
    <blockquote
cite="mid:CAJTo0LY4eFrus=dOy4PzbauML6iz4qzpCKrw9rp-pLCy6YiscQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><tt><br>
          </tt>
          <div class="gmail_quote"><tt>On 22 November 2016 at 14:07,
              Jack Mitchell </tt><tt><span dir="ltr">&lt;<a
                  moz-do-not-send="true" href="mailto:ml@embed.me.uk"
                  target="_blank">ml@embed.me.uk</a>&gt;</span></tt><tt>
              wrote:</tt><tt><br>
            </tt>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1r5" class="a3s aXjCH m1588c658056630c2"><tt>With
                  the recent changes to distro checking the lsb_release
                  binary is now</tt><tt><br>
                </tt><tt>
                  required. I tried adding this to
                  SANITY_REQUIRED_UTILITIES however it</tt><tt><br>
                </tt><tt>
                  seems as though the distro check is done before the
                  SanityEvent is</tt><tt><br>
                </tt><tt>
                  triggered. Where would be the best place to check this
                  binary is</tt><tt><br>
                </tt><tt>
                  available to prevent an ugly python traceback?</tt><tt><br>
                </tt></div>
            </blockquote>
          </div>
          <tt><br>
          </tt><tt>It shouldn't be required at all.  What error are you
            getting?</tt></div>
      </div>
    </blockquote>
    <tt><br>
    </tt><tt>You can also run generated qemu images with a command like
      'runqemu qemux86'</tt><tt><br>
    </tt><tt>ERROR: Execution of event handler 'base_eventhandler'
      failed</tt><tt><br>
    </tt><tt>Traceback (most recent call last):</tt><tt><br>
    </tt><tt>  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/classes/base.bbclass",
      line 214, in base_eventhandler(e=&lt;bb.event.ConfigParsed object
      at 0x7fb511f75438&gt;):</tt><tt><br>
    </tt><tt>             if not e.data.getVar("NATIVELSBSTRING",
      False):</tt><tt><br>
    </tt><tt>    &gt;            e.data.setVar("NATIVELSBSTRING",
      lsb_distro_identifier(e.data))</tt><tt><br>
    </tt><tt>             e.data.setVar('BB_VERSION', bb.__version__)</tt><tt><br>
    </tt><tt>  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/classes/base.bbclass",
      line 47, in lsb_distro_identifier(d=&lt;bb.data_smart.DataSmart
      object at 0x7fb5124079b0&gt;):</tt><tt><br>
    </tt><tt>                 pass</tt><tt><br>
    </tt><tt>    &gt;    return oe.lsb.distro_identifier(adjust_func)</tt><tt><br>
    </tt><tt>     </tt><tt><br>
    </tt><tt>  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/lib/oe/lsb.py",
      line 99, in distro_identifier(adjust_hook=None):</tt><tt><br>
    </tt><tt>     </tt><tt><br>
    </tt><tt>    &gt;    distro_id = distro_data['DISTRIB_ID']</tt><tt><br>
    </tt><tt>         release = distro_data['DISTRIB_RELEASE']</tt><tt><br>
    </tt><tt>TypeError: 'NoneType' object is not subscriptable</tt><tt><br>
    </tt><tt><br>
    </tt><tt>ERROR: Error parsing configuration files</tt><tt><br>
    </tt><tt>Traceback (most recent call last):</tt><tt><br>
    </tt><tt>  File
"/home/jack/work/build/build-build/openembedded/bitbake.git/lib/bb/event.py",
      line 124, in fire_class_handlers(event=&lt;bb.event.ConfigParsed
      object at 0x7fb511f75438&gt;, d=&lt;bb.data_smart.DataSmart object
      at 0x7fb5124079b0&gt;):</tt><tt><br>
    </tt><tt>                         continue</tt><tt><br>
    </tt><tt>    &gt;            execute_handler(name, handler, event,
      d)</tt><tt><br>
    </tt><tt>     </tt><tt><br>
    </tt><tt>  File
"/home/jack/work/build/build-build/openembedded/bitbake.git/lib/bb/event.py",
      line 96, in execute_handler(name='base_eventhandler',
      handler=&lt;function base_eventhandler at 0x7fb511fd02f0&gt;,
      event=&lt;bb.event.ConfigParsed object at 0x7fb511f75438&gt;,
      d=&lt;bb.data_smart.DataSmart object at 0x7fb5124079b0&gt;):</tt><tt><br>
    </tt><tt>         try:</tt><tt><br>
    </tt><tt>    &gt;        ret = handler(event)</tt><tt><br>
    </tt><tt>         except (bb.parse.SkipRecipe,
      bb.BBHandledException):</tt><tt><br>
    </tt><tt>  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/classes/base.bbclass",
      line 214, in base_eventhandler(e=&lt;bb.event.ConfigParsed object
      at 0x7fb511f75438&gt;):</tt><tt><br>
    </tt><tt>             if not e.data.getVar("NATIVELSBSTRING",
      False):</tt><tt><br>
    </tt><tt>    &gt;            e.data.setVar("NATIVELSBSTRING",
      lsb_distro_identifier(e.data))</tt><tt><br>
    </tt><tt>             e.data.setVar('BB_VERSION', bb.__version__)</tt><tt><br>
    </tt><tt>  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/classes/base.bbclass",
      line 47, in lsb_distro_identifier(d=&lt;bb.data_smart.DataSmart
      object at 0x7fb5124079b0&gt;):</tt><tt><br>
    </tt><tt>                 pass</tt><tt><br>
    </tt><tt>    &gt;    return oe.lsb.distro_identifier(adjust_func)</tt><tt><br>
    </tt><tt>     </tt><tt><br>
    </tt><tt>  File
"/home/jack/work/build/build-build/openembedded/oe-core.git/meta/lib/oe/lsb.py",
      line 99, in distro_identifier(adjust_hook=None):</tt><tt><br>
    </tt><tt>     </tt><tt><br>
    </tt><tt>    &gt;    distro_id = distro_data['DISTRIB_ID']</tt><tt><br>
    </tt><tt>         release = distro_data['DISTRIB_RELEASE']</tt><tt><br>
    </tt><tt>TypeError: 'NoneType' object is not subscriptable</tt><tt><br>
    </tt><tt><br>
    </tt><tt><br>
    </tt>
  </body>
</html>

--------------EB1E8E27B7A7CC996ED8E0E5--
