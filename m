Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5E70378419
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 11:52:55 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id f143so23673422itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 03:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vnc1O1lhZ09Z9pHl+AKdmkGMf1EnucF60QiI7kNVdpg=;
	b=zdaXRRjgv6omhGejVD6kx9tJmKGMCpYX4Nq0w2G+HCpgOqLSOOgjYuq3AetVAx1Xd4
	6i9wbVWS9taQn1f5nJjm75WEjrqUlsEk6f61+neOp+FsGFZrVXIexNMEa8RxHPBp+2p7
	a9gmQoMQX96KArgbMBIqeh6XOiQSxqM4iJ65Bm8xNncnahb1C2m0RA1LFwU2/51RRmCm
	5puVx37T9rbG3YkSxWppjS6ovU+YbEcUjbBHmx+62QpQgoI/lJNtHjR5vu881ls4XfWh
	a6p9svF6LNi8JgY7lnqLPKt9yrmV4mvWeNTCXwOE4ASIWkDkgdevlpGow/cybvxz+UTp
	m0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vnc1O1lhZ09Z9pHl+AKdmkGMf1EnucF60QiI7kNVdpg=;
	b=UdAwjJ7zEteMwTz7Ycu1BZWjlzUAT8glvIAxEj5kxw8YwPkbqigBQOhoUfArMhfgU7
	NTfeGjJubD3itk5pKdDndEMyM2B/XVK++Vs8G0D8MPPAZNgbAhiHVwRz/67HTtzX8so/
	9LiLizUiksoDlWjUb3FSZHRfnQAtdVAjcNMGTBseOetAOBWn+YTSB4/YpdxM+LhFAksB
	4eLiQ6o/Q/iFM6vb9To2za/HBDUs2hPpb4msrZ07BYMkYc5lwo+w+A6TV2Nw4+ACK09Q
	r0JuEy3g3cDmSZvRAAX9uZ2yRFp0u/tUShJWOckHKd7yeYdW9d86Qgq5KisJ6BITm62O
	Mkog==
X-Gm-Message-State: AKGB3mJv4gU0O+AauUuq6ep5wpQbgnBn4X09eF1CFgnXo2w1ofM46DmF
	S+rJZresfWWB2RCE0boe/c/13P/cRLbpAZPSWDumsQ==
X-Google-Smtp-Source: ACJfBotETPoEQM1LPfqZwqAzQhD34q4Akm4ym5Ueywhbya7vX+RYMyjTU4dzLoSQ51iUXzo24Wdet80vr/OccnoJqt8=
X-Received: by 10.36.80.148 with SMTP id m142mr2280392itb.6.1513079576913;
	Tue, 12 Dec 2017 03:52:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 12 Dec 2017 03:52:36 -0800 (PST)
In-Reply-To: <7F962FC7-4CA5-421E-BD5D-0F0B4171790F@intel.com>
References: <7F962FC7-4CA5-421E-BD5D-0F0B4171790F@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Dec 2017 11:52:36 +0000
Message-ID: <CAJTo0LZvFo6hkpO4oOFqcRvcwfuteejfytKi15wse_UkAACS+A@mail.gmail.com>
To: "Elliot, Amber N" <amber.n.elliot@intel.com>
Cc: "Wold, Saul" <saul.wold@intel.com>, "Eggleton,
	Paul" <paul.eggleton@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] wic: argparse now used for help functionality
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
X-List-Received-Date: Tue, 12 Dec 2017 11:52:56 -0000
Content-Type: multipart/alternative; boundary="001a114387b8b3019c0560234a2c"

--001a114387b8b3019c0560234a2c
Content-Type: text/plain; charset="UTF-8"

Hi Amber,

Can you resend that using git-send-email?  Copy/pasting it into a mail
client has sent it as HTML, which git-apply can't read.

Cheers,
Ross

On 11 December 2017 at 21:25, Elliot, Amber N <amber.n.elliot@intel.com>
wrote:

> The wic help output formally consisted of manually created strings mixed
> with argparse,
> which was unformatted and unusable. This fix cleans up the help messages,
> rewrites help
> functionality to use argparse, and adds functionality to show information
> for
> plugins (similar to canned images).
>
> Fixes [YOCTO #12205]
>
> Signed-off-by: anelliot <amber.n.elliot@intel.com>
> ---
>  scripts/lib/wic/engine.py |   87 +++-
>  scripts/lib/wic/help.py   | 1072 +++++-------------------------
> ---------------
>  scripts/wic               |  169 +++----
>  3 files changed, 243 insertions(+), 1085 deletions(-)
>
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index edcfab3..5d1e1d8 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -58,6 +58,8 @@ def verify_build_env():
>
>  CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
>  SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
> +SOURCE_PLUGIN_DIR = "lib/wic/plugins/source"
> +SCRIPTS_SOURCE_PLUGIN_DIR = "scripts/" + SOURCE_PLUGIN_DIR
>  WIC_DIR = "wic"
>
>  def build_canned_image_list(path):
> @@ -76,6 +78,23 @@ def build_canned_image_list(path):
>
>      return canned_wks_layer_dirs
>
> +def build_source_plugin_list(path):
> +    layers_path = get_bitbake_var("BBLAYERS")
> +    canned_wks_layer_dirs = []
> +
> +    if layers_path is not None:
> +        for layer_path in layers_path.split():
> +            for wks_path in (WIC_DIR, SCRIPTS_SOURCE_PLUGIN_DIR):
> +                cpath = os.path.join(layer_path, wks_path)
> +                if os.path.isdir(cpath):
> +                    canned_wks_layer_dirs.append(cpath)
> +
> +    cpath = os.path.join(path, SOURCE_PLUGIN_DIR)
> +    canned_wks_layer_dirs.append(cpath)
> +
> +    return canned_wks_layer_dirs
> +
> +
>  def find_canned_image(scripts_path, wks_file):
>      """
>      Find a .wks file with the given name in the canned files dir.
> @@ -95,6 +114,24 @@ def find_canned_image(scripts_path, wks_file):
>      return None
>
>
> +def find_source_plugin(scripts_path, plugin_file):
> +    """
> +    Find a .py file with the given name in the source plugin dir.
> +
> +    Return False if not found
> +    """
> +    layers_source_plugin_dir = build_source_plugin_list(scripts_path)
> +
> +    for source_plugin_dir in layers_source_plugin_dir:
> +        for root, dirs, files in os.walk(source_plugin_dir):
> +            for fname in files:
> +                if fname.endswith("~") or fname.endswith("#"):
> +                    continue
> +                if fname.endswith(".py") and plugin_file + ".py" == fname:
> +                    fullpath = os.path.join(source_plugin_dir, fname)
> +                    return fullpath
> +    return None
> +
>  def list_canned_images(scripts_path):
>      """
>      List the .wks files in the canned image dir, minus the extension.
> @@ -119,7 +156,7 @@ def list_canned_images(scripts_path):
>                      print("  %s\t\t%s" % (basename.ljust(30), desc))
>
>
> -def list_canned_image_help(scripts_path, fullpath):
> +def list_canned_image_help(fullpath):
>      """
>      List the help and params in the specified canned image.
>      """
> @@ -139,6 +176,7 @@ def list_canned_image_help(scripts_path, fullpath):
>              if idx != -1:
>                  print(line[idx + len("#:"):].rstrip())
>              else:
> +                print()
>                  break
>
>
> @@ -152,6 +190,29 @@ def list_source_plugins():
>          print("  %s" % plugin)
>
>
> +def list_source_plugins_help(fullpath):
> +    """
> +    List the help and params in the specified canned image.
> +    """
> +    found = False
> +    with open(fullpath) as plugin:
> +        for line in plugin:
> +            if not found:
> +                idx = line.find("DESCRIPTION")
> +                if idx != -1:
> +                    print(line[idx + len("DESCRIPTION"):].strip())
> +                    found = True
> +                continue
> +            if not line.strip():
> +                break
> +            idx = line.find("#")
> +            auth = line.find("AUTHORS")
> +            if idx != -1 and auth == -1:
> +                print(line[idx + len("#:"):].rstrip())
> +            else:
> +                break
> +
> +
>  def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
>                 native_sysroot, options):
>      """
> @@ -204,7 +265,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir,
> kernel_dir,
>      logger.info("The image(s) were created using OE kickstart file:\n
>  %s", wks_file)
>
>
> -def wic_list(args, scripts_path):
> +def wic_list(scripts_path, args):
>      """
>      Print the list of images or source plugins.
>      """
> @@ -218,16 +279,20 @@ def wic_list(args, scripts_path):
>      elif args.list_type == "source-plugins":
>          list_source_plugins()
>          return True
> -    elif len(args.help_for) == 1 and args.help_for[0] == 'help':
> -        wks_file = args.list_type
> -        fullpath = find_canned_image(scripts_path, wks_file)
> +    elif len(args.info_for) == 1 and args.info_for[0] == 'info':
> +        input_file = args.list_type
> +        fullpath = find_canned_image(scripts_path, input_file)
>          if not fullpath:
> -            raise WicError("No image named %s found, exiting. "
> -                           "(Use 'wic list images' to list available
> images, "
> -                           "or specify a fully-qualified OE kickstart
> (.wks) "
> -                           "filename)" % wks_file)
> -
> -        list_canned_image_help(scripts_path, fullpath)
> +            fullpath = find_source_plugin(scripts_path, input_file)
> +            if not fullpath:
> +                raise WicError("No image named %s found, exiting. "
> +                               "(Use 'wic list images' to list available
> images, "
> +                               "or specify a fully-qualified OE kickstart
> (.wks) "
> +                               "filename)" % input_file)
> +            else:
> +                list_source_plugins_help(fullpath)
> +        else:
> +            list_canned_image_help(fullpath)
>          return True
>
>      return False
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 2ac45e0..8230395 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -30,1014 +30,166 @@ import logging
>
>  from wic.pluginbase import PluginMgr, PLUGIN_TYPES
>
> -logger = logging.getLogger('wic')
> -
> -def subcommand_error(args):
> -    logger.info("invalid subcommand %s", args[0])
> -
> -
> -def display_help(subcommand, subcommands):
> -    """
> -    Display help for subcommand.
> -    """
> -    if subcommand not in subcommands:
> -        return False
> -
> -    hlp = subcommands.get(subcommand, subcommand_error)[2]
> -    if callable(hlp):
> -        hlp = hlp()
> -    pager = subprocess.Popen('less', stdin=subprocess.PIPE)
> -    pager.communicate(hlp.encode('utf-8'))
> -
> -    return True
> -
> -
> -def wic_help(args, usage_str, subcommands):
> -    """
> -    Subcommand help dispatcher.
> -    """
> -    if args.help_topic == None or not display_help(args.help_topic,
> subcommands):
> -        print(usage_str)
> -
> -
> -def get_wic_plugins_help():
> -    """
> -    Combine wic_plugins_help with the help for every known
> -    source plugin.
> -    """
> -    result = wic_plugins_help
> -    for plugin_type in PLUGIN_TYPES:
> -        result += '\n\n%s PLUGINS\n\n' % plugin_type.upper()
> -        for name, plugin in PluginMgr.get_plugins(plugin_type).items():
> -            result += "\n %s plugin:\n" % name
> -            if plugin.__doc__:
> -                result += plugin.__doc__
> -            else:
> -                result += "\n    %s is missing docstring\n" % plugin
> -    return result
> -
> -
> -def invoke_subcommand(args, parser, main_command_usage, subcommands):
> -    """
> -    Dispatch to subcommand handler borrowed from combo-layer.
> -    Should use argparse, but has to work in 2.6.
> -    """
> -    if not args.command:
> -        logger.error("No subcommand specified, exiting")
> -        parser.print_help()
> -        return 1
> -    elif args.command == "help":
> -        wic_help(args, main_command_usage, subcommands)
> -    elif args.command not in subcommands:
> -        logger.error("Unsupported subcommand %s, exiting\n", args.command)
> -        parser.print_help()
> -        return 1
> -    else:
> -        subcmd = subcommands.get(args.command, subcommand_error)
> -        usage = subcmd[1]
> -        subcmd[0](args, usage)
> -
> -
> -##
> +# ##
>  # wic help and usage strings
>  ##
>
> -wic_usage = """
> -
> - Create a customized OpenEmbedded image
> -
> - usage: wic [--version] | [--help] | [COMMAND [ARGS]]
> -
> - Current 'wic' commands are:
> -    help              Show help for command or one of the topics (see
> below)
> -    create            Create a new OpenEmbedded image
> -    list              List available canned images and source plugins
> -
> - Help topics:
> -    overview          wic overview - General overview of wic
> -    plugins           wic plugins - Overview and API
> -    kickstart         wic kickstart - wic kickstart reference
> -"""
> -
> -wic_help_usage = """
> -
> - usage: wic help <subcommand>
> -
> - This command displays detailed help for the specified subcommand.
> -"""
> -
> -wic_create_usage = """
> -
> - Create a new OpenEmbedded image
> -
> - usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir
> <DIRNAME>]
> -            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
> -            [-r, --rootfs-dir] [-b, --bootimg-dir]
> -            [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
> -            [-c, --compress-with] [-m, --bmap]
> -
> - This command creates an OpenEmbedded image based on the 'OE kickstart
> - commands' found in the <wks file>.
> -
> - The -o option can be used to place the image in a directory with a
> - different name and location.
> -
> - See 'wic help create' for more detailed instructions.
> -"""
> -
> -wic_create_help = """
> -
> -NAME
> -    wic create - Create a new OpenEmbedded image
> -
> -SYNOPSIS
> -    wic create <wks file or image name> [-o <DIRNAME> | --outdir
> <DIRNAME>]
> -        [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
> -        [-r, --rootfs-dir] [-b, --bootimg-dir]
> -        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
> -        [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
> -
> -DESCRIPTION
> -    This command creates an OpenEmbedded image based on the 'OE
> -    kickstart commands' found in the <wks file>.
> -
> -    In order to do this, wic needs to know the locations of the
> -    various build artifacts required to build the image.
> -
> -    Users can explicitly specify the build artifact locations using
> -    the -r, -b, -k, and -n options.  See below for details on where
> -    the corresponding artifacts are typically found in a normal
> -    OpenEmbedded build.
> -
> -    Alternatively, users can use the -e option to have 'wic' determine
> -    those locations for a given image.  If the -e option is used, the
> -    user needs to have set the appropriate MACHINE variable in
> -    local.conf, and have sourced the build environment.
> -
> -    The -e option is used to specify the name of the image to use the
> -    artifacts from e.g. core-image-sato.
> -
> -    The -r option is used to specify the path to the /rootfs dir to
> -    use as the .wks rootfs source.
> -
> -    The -b option is used to specify the path to the dir containing
> -    the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the
> -    .wks bootimg source.
> -
> -    The -k option is used to specify the path to the dir containing
> -    the kernel to use in the .wks bootimg.
> -
> -    The -n option is used to specify the path to the native sysroot
> -    containing the tools to use to build the image.
> -
> -    The -f option is used to build rootfs by running "bitbake <image>"
> -
> -    The -s option is used to skip the build check.  The build check is
> -    a simple sanity check used to determine whether the user has
> -    sourced the build environment so that the -e option can operate
> -    correctly.  If the user has specified the build artifact locations
> -    explicitly, 'wic' assumes the user knows what he or she is doing
> -    and skips the build check.
> -
> -    The -D option is used to display debug information detailing
> -    exactly what happens behind the scenes when a create request is
> -    fulfilled (or not, as the case may be).  It enumerates and
> -    displays the command sequence used, and should be included in any
> -    bug report describing unexpected results.
> -
> -    When 'wic -e' is used, the locations for the build artifacts
> -    values are determined by 'wic -e' from the output of the 'bitbake
> -    -e' command given an image name e.g. 'core-image-minimal' and a
> -    given machine set in local.conf.  In that case, the image is
> -    created as if the following 'bitbake -e' variables were used:
> -
> -    -r:        IMAGE_ROOTFS
> -    -k:        STAGING_KERNEL_DIR
> -    -n:        STAGING_DIR_NATIVE
> -    -b:        empty (plugin-specific handlers must determine this)
> -
> -    If 'wic -e' is not used, the user needs to select the appropriate
> -    value for -b (as well as -r, -k, and -n).
> -
> -    The -o option can be used to place the image in a directory with a
> -    different name and location.
> -
> -    The -c option is used to specify compressor utility to compress
> -    an image. gzip, bzip2 and xz compressors are supported.
> -
> -    The -m option is used to produce .bmap file for the image. This file
> -    can be used to flash image using bmaptool utility.
> -
> -    The --no-fstab-update option is used to doesn't change fstab file.
> When
> -    using this option the final fstab file will be same that in rootfs and
> -    wic doesn't update file, e.g adding a new mount point. User can
> control
> -    the fstab file content in base-files recipe.
> -"""
> -
> -wic_list_usage = """
> -
> - List available OpenEmbedded images and source plugins
> -
> - usage: wic list images
> -        wic list <image> help
> -        wic list source-plugins
> -
> - This command enumerates the set of available canned images as well as
> - help for those images.  It also can be used to list of available source
> - plugins.
> -
> - The first form enumerates all the available 'canned' images.
> -
> - The second form lists the detailed help information for a specific
> - 'canned' image.
> -
> - The third form enumerates all the available --sources (source
> - plugins).
> -
> - See 'wic help list' for more details.
> +wic_create_short_description = """
> +Create a new OpenEmbedded image.
>  """
>
> -wic_list_help = """
> -
> -NAME
> -    wic list - List available OpenEmbedded images and source plugins
> -
> -SYNOPSIS
> -    wic list images
> -    wic list <image> help
> -    wic list source-plugins
> -
> -DESCRIPTION
> -    This command enumerates the set of available canned images as well
> -    as help for those images.  It also can be used to list available
> -    source plugins.
> -
> -    The first form enumerates all the available 'canned' images.
> -    These are actually just the set of .wks files that have been moved
> -    into the /scripts/lib/wic/canned-wks directory).
> -
> -    The second form lists the detailed help information for a specific
> -    'canned' image.
> -
> -    The third form enumerates all the available --sources (source
> -    plugins).  The contents of a given partition are driven by code
> -    defined in 'source plugins'.  Users specify a specific plugin via
> -    the --source parameter of the partition .wks command.  Normally
> -    this is the 'rootfs' plugin but can be any of the more specialized
> -    sources listed by the 'list source-plugins' command.  Users can
> -    also add their own source plugins - see 'wic help plugins' for
> -    details.
> +wic_rm_short_description = """
> +Remove files or directories from the vfat or ext* partitions.
>  """
>
> -wic_ls_usage = """
> -
> - List content of a partitioned image
> -
> - usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>]
> -
> - This command  outputs either list of image partitions or directory
> contents
> - of vfat and ext* partitions.
> -
> - See 'wic help ls' for more detailed instructions.
> -
> +wic_write_short_description = """
> +Write an image to a device.
>  """
>
> -wic_ls_help = """
> -
> -NAME
> -    wic ls - List contents of partitioned image or partition
> -
> -SYNOPSIS
> -    wic ls <image>
> -    wic ls <image>:<vfat or ext* partition>
> -    wic ls <image>:<vfat or ext* partition><path>
> -    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path>
> -
> -DESCRIPTION
> -    This command lists either partitions of the image or directory
> contents
> -    of vfat or ext* partitions.
> -
> -    The first form it lists partitions of the image.
> -    For example:
> -        $ wic ls tmp/deploy/images/qemux86-64/
> core-image-minimal-qemux86-64.wic
> -        Num     Start        End          Size      Fstype
> -        1        1048576     24438783     23390208  fat16
> -        2       25165824     50315263     25149440  ext4
> -
> -    Second and third form list directory content of the partition:
> -        $ wic ls tmp/deploy/images/qemux86-64/
> core-image-minimal-qemux86-64.wic:1
> -        Volume in drive : is boot
> -         Volume Serial Number is 2DF2-5F02
> -        Directory for ::/
> -
> -        efi          <DIR>     2017-05-11  10:54
> -        startup  nsh        26 2017-05-11  10:54
> -        vmlinuz        6922288 2017-05-11  10:54
> -                3 files           6 922 314 bytes
> -                                 15 818 752 bytes free
> -
> -
> -        $ wic ls tmp/deploy/images/qemux86-64/
> core-image-minimal-qemux86-64.wic:1/EFI/boot/
> -        Volume in drive : is boot
> -         Volume Serial Number is 2DF2-5F02
> -        Directory for ::/EFI/boot
> -
> -        .            <DIR>     2017-05-11  10:54
> -        ..           <DIR>     2017-05-11  10:54
> -        grub     cfg       679 2017-05-11  10:54
> -        bootx64  efi    571392 2017-05-11  10:54
> -                4 files             572 071 bytes
> -                                 15 818 752 bytes free
> -
> -    The -n option is used to specify the path to the native sysroot
> -    containing the tools(parted and mtools) to use.
> -
> -"""
> -
> -wic_cp_usage = """
> -
> - Copy files and directories to the vfat or ext* partition
> -
> - usage: wic cp <src> <image>:<partition>[<path>] [--native-sysroot <path>]
> -
> - This command  copies local files or directories to the vfat or ext*
> partitions
> -of partitioned  image.
> -
> - See 'wic help cp' for more detailed instructions.
> -
> +wic_cp_short_description = """
> +Copy files and directories to the vfat or ext* partitions.
>  """
>
> -wic_cp_help = """
> -
> -NAME
> -    wic cp - copy files and directories to the vfat or ext* partitions
> -
> -SYNOPSIS
> -    wic cp <src> <image>:<partition>
> -    wic cp <src> <image>:<partition><path>
> -    wic cp <src> <image>:<partition><path> --native-sysroot <path>
> -
> -DESCRIPTION
> -    This command copies files and directories to the vfat or ext*
> partition of
> -    the partitioned image.
> -
> -    The first form of it copies file or directory to the root directory of
> -    the partition:
> -        $ wic cp test.wks tmp/deploy/images/qemux86-64/
> core-image-minimal-qemux86-64.wic:1
> -        $ wic ls tmp/deploy/images/qemux86-64/
> core-image-minimal-qemux86-64.wic:1
> -        Volume in drive : is boot
> -         Volume Serial Number is DB4C-FD4C
> -        Directory for ::/
> -
> -        efi          <DIR>     2017-05-24  18:15
> -        loader       <DIR>     2017-05-24  18:15
> -        startup  nsh        26 2017-05-24  18:15
> -        vmlinuz        6926384 2017-05-24  18:15
> -        test     wks       628 2017-05-24  21:22
> -                5 files           6 927 038 bytes
> -                                 15 677 440 bytes free
> -
> -    The second form of the command copies file or directory to the
> specified directory
> -    on the partition:
> -       $ wic cp test tmp/deploy/images/qemux86-64/
> core-image-minimal-qemux86-64.wic:1/efi/
> -       $ wic ls tmp/deploy/images/qemux86-64/
> core-image-minimal-qemux86-64.wic:1/efi/
> -       Volume in drive : is boot
> -        Volume Serial Number is DB4C-FD4C
> -       Directory for ::/efi
> -
> -       .            <DIR>     2017-05-24  18:15
> -       ..           <DIR>     2017-05-24  18:15
> -       boot         <DIR>     2017-05-24  18:15
> -       test         <DIR>     2017-05-24  21:27
> -               4 files                   0 bytes
> -                                15 675 392 bytes free
> -
> -    The -n option is used to specify the path to the native sysroot
> -    containing the tools(parted and mtools) to use.
> +wic_ls_short_description = """
> +Lists either partitions of the image or directory contents
> +of vfat or ext* partitions."""
> +wic_help_short_description = """
> +sss
>  """
> -
> -wic_rm_usage = """
> -
> - Remove files or directories from the vfat or ext* partitions
> -
> - usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
> -
> - This command  removes files or directories from the vfat or ext*
> partitions of
> - the partitioned image.
> -
> - See 'wic help rm' for more detailed instructions.
> -
> +wic_list_short_description = """
> +List available canned images and source plugins
>  """
>
> -wic_rm_help = """
> +wic_create_description = """
> +This command creates an OpenEmbedded image based on the 'OE
> +kickstart commands' found in the <wks file>.
>
> -NAME
> -    wic rm - remove files or directories from the vfat or ext* partitions
> +In order to do this, wic needs to know the locations of the
> +various build artifacts required to build the image.
>
> -SYNOPSIS
> -    wic rm <src> <image>:<partition><path>
> -    wic rm <src> <image>:<partition><path> --native-sysroot <path>
> +Users can explicitly specify the build artifact locations using
> +the -r, -b, -k, and -n options.  See below for details on where
> +the corresponding artifacts are typically found in a normal
> +OpenEmbedded build.
>
> -DESCRIPTION
> -    This command removes files or directories from the vfat or ext*
> partition of the
> -    partitioned image:
> +Alternatively, users can use the -e option to have 'wic' determine
> +those locations for a given image.  If the -e option is used, the
> +user needs to have set the appropriate MACHINE variable in
> +local.conf, and have sourced the build environment.
>
> -        $ wic ls ./tmp/deploy/images/qemux86-
> 64/core-image-minimal-qemux86-64.wic:1
> -        Volume in drive : is boot
> -         Volume Serial Number is 11D0-DE21
> -        Directory for ::/
> +The -s option is used to skip the build check.  The build check is
> +a simple sanity check used to determine whether the user has
> +sourced the build environment so that the -e option can operate
> +correctly.  If the user has specified the build artifact locations
> +explicitly, 'wic' assumes the user knows what he or she is doing
> +and skips the build check.
>
> -        libcom32 c32    186500 2017-06-02  15:15
> -        libutil  c32     24148 2017-06-02  15:15
> -        syslinux cfg       209 2017-06-02  15:15
> -        vesamenu c32     27104 2017-06-02  15:15
> -        vmlinuz        6926384 2017-06-02  15:15
> -                5 files           7 164 345 bytes
> -                                 16 582 656 bytes free
> +When 'wic -e' is used, the locations for the build artifacts
> +values are determined by 'wic -e' from the output of the 'bitbake
> +-e' command given an image name e.g. 'core-image-minimal' and a
> +given machine set in local.conf.  In that case, the image is
> +created as if the following 'bitbake -e' variables were used:
>
> -        $ wic rm ./tmp/deploy/images/qemux86-
> 64/core-image-minimal-qemux86-64.wic:1/libutil.c32
> +-r:        IMAGE_ROOTFS
> +-k:        STAGING_KERNEL_DIR
> +-n:        STAGING_DIR_NATIVE
> +-b:        empty (plugin-specific handlers must determine this)
>
> -        $ wic ls ./tmp/deploy/images/qemux86-
> 64/core-image-minimal-qemux86-64.wic:1
> -        Volume in drive : is boot
> -         Volume Serial Number is 11D0-DE21
> -        Directory for ::/
> +If 'wic -e' is not used, the user needs to select the appropriate
> +value for -b (as well as -r, -k, and -n).
>
> -        libcom32 c32    186500 2017-06-02  15:15
> -        syslinux cfg       209 2017-06-02  15:15
> -        vesamenu c32     27104 2017-06-02  15:15
> -        vmlinuz        6926384 2017-06-02  15:15
> -                4 files           7 140 197 bytes
> -                                 16 607 232 bytes free
> +Here's an example that doesn't take the easy way out and manually
> +specifies each build artifact, along with a non-canned .wks file,
> +and also uses the -o option to have wic create the output
> +somewhere other than the default /var/tmp/wic:
>
> -    The -n option is used to specify the path to the native sysroot
> -    containing the tools(parted and mtools) to use.
> +  $ wic create ./test.wks -o ./out --rootfs-dir
> +  tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
> +  --bootimg-dir tmp/sysroots/qemux86-64/usr/share
> +  --kernel-dir tmp/deploy/images/qemux86-64
> +  --native-sysroot tmp/sysroots/x86_64-linux
>  """
>
> -wic_write_usage = """
>
> - Write image to a device
> +wic_list_description = """
> +This command enumerates the set of available canned images as well
> +as help for those images.  It also can be used to list available
> +source plugins.
>
> - usage: wic write <image> <target device> [--expand [rules]]
> [--native-sysroot <path>]
> +The first form enumerates all the available 'canned' images.
> +These are actually just the set of .wks files that have been moved
> +into the /scripts/lib/wic/canned-wks directory).
>
> - This command writes partitioned image to a target device (USB stick, SD
> card etc).
> -
> - See 'wic help write' for more detailed instructions.
> +The second form lists the detailed help information for a specific
> +'canned' image.
>
> +The third form enumerates all the available --sources (source
> +plugins).  The contents of a given partition are driven by code
> +defined in 'source plugins'.  Users specify a specific plugin via
> +the --source parameter of the partition .wks command.  Normally
> +this is the 'rootfs' plugin but can be any of the more specialized
> +sources listed by the 'list source-plugins' command.  Users can
> +also add their own source plugins - see 'wic help plugins' for
> +details.
>  """
>
> -wic_write_help = """
>
> -NAME
> -    wic write - write an image to a device
> +wic_ls_description = """
> +This command lists either partitions of the image or directory contents
> +of vfat or ext* partitions.
>
> -SYNOPSIS
> -    wic write <image> <target>
> -    wic write <image> <target> --expand auto
> -    wic write <image> <target> --expand 1:100M-2:300M
> -    wic write <image> <target> --native-sysroot <path>
> +The first form lists partitions of the image.
> +For example:
> +    $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.
> wic
> +    Num     Start        End          Size      Fstype
> +    1        1048576     24438783     23390208  fat16
> +    2       25165824     50315263     25149440  ext4
>
> -DESCRIPTION
> -    This command writes an image to a target device (USB stick, SD card
> etc)
> +The second form lists directory contents of the first partition:
>
> -        $ wic write ./tmp/deploy/images/qemux86-
> 64/core-image-minimal-qemux86-64.wic /dev/sdb
> +    $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.
> wic:1/EFI/boot/
> +    Volume in drive : is boot
> +     Volume Serial Number is 2DF2-5F02
> +    Directory for ::/EFI/boot
>
> -    The --expand option is used to resize image partitions.
> -    --expand auto expands partitions to occupy all free space available
> on the target device.
> -    It's also possible to specify expansion rules in a format
> -    <partition>:<size>[-<partition>:<size>...] for one or more
> partitions.
> -    Specifying size 0 will keep partition unmodified.
> -    Note: Resizing boot partition can result in non-bootable image for
> non-EFI images. It is
> -    recommended to use size 0 for boot partition to keep image bootable.
> +    .            <DIR>     2017-05-11  10:54
> +    ..           <DIR>     2017-05-11  10:54
> +    grub     cfg       679 2017-05-11  10:54
> +    bootx64  efi    571392 2017-05-11  10:54
> +            4 files             572 071 bytes
> +                             15 818 752 bytes free
>
> -    The --native-sysroot option is used to specify the path to the native
> sysroot
> -    containing the tools(parted, resize2fs) to use.
>  """
>
> -wic_plugins_help = """
> -
> -NAME
> -    wic plugins - Overview and API
> -
> -DESCRIPTION
> -    plugins allow wic functionality to be extended and specialized by
> -    users.  This section documents the plugin interface, which is
> -    currently restricted to 'source' plugins.
> -
> -    'Source' plugins provide a mechanism to customize various aspects
> -    of the image generation process in wic, mainly the contents of
> -    partitions.
> -
> -    Source plugins provide a mechanism for mapping values specified in
> -    .wks files using the --source keyword to a particular plugin
> -    implementation that populates a corresponding partition.
> -
> -    A source plugin is created as a subclass of SourcePlugin (see
> -    scripts/lib/wic/pluginbase.py) and the plugin file containing it
> -    is added to scripts/lib/wic/plugins/source/ to make the plugin
> -    implementation available to the wic implementation.
> -
> -    Source plugins can also be implemented and added by external
> -    layers - any plugins found in a scripts/lib/wic/plugins/source/
> -    directory in an external layer will also be made available.
> -
> -    When the wic implementation needs to invoke a partition-specific
> -    implementation, it looks for the plugin that has the same name as
> -    the --source param given to that partition.  For example, if the
> -    partition is set up like this:
> -
> -      part /boot --source bootimg-pcbios   ...
> -
> -    then the methods defined as class members of the plugin having the
> -    matching bootimg-pcbios .name class member would be used.
> -
> -    To be more concrete, here's the plugin definition that would match
> -    a '--source bootimg-pcbios' usage, along with an example method
> -    that would be called by the wic implementation when it needed to
> -    invoke an implementation-specific partition-preparation function:
> -
> -    class BootimgPcbiosPlugin(SourcePlugin):
> -        name = 'bootimg-pcbios'
> +wic_cp_description = """
> +This command copies files and directories to the vfat or ext* partition of
> +the partitioned image.
>
> -    @classmethod
> -        def do_prepare_partition(self, part, ...)
> -
> -    If the subclass itself doesn't implement a function, a 'default'
> -    version in a superclass will be located and used, which is why all
> -    plugins must be derived from SourcePlugin.
> -
> -    The SourcePlugin class defines the following methods, which is the
> -    current set of methods that can be implemented/overridden by
> -    --source plugins.  Any methods not implemented by a SourcePlugin
> -    subclass inherit the implementations present in the SourcePlugin
> -    class (see the SourcePlugin source for details):
> -
> -      do_prepare_partition()
> -          Called to do the actual content population for a
> -          partition. In other words, it 'prepares' the final partition
> -          image which will be incorporated into the disk image.
> -
> -      do_configure_partition()
> -          Called before do_prepare_partition(), typically used to
> -          create custom configuration files for a partition, for
> -          example syslinux or grub config files.
> -
> -      do_install_disk()
> -          Called after all partitions have been prepared and assembled
> -          into a disk image.  This provides a hook to allow
> -          finalization of a disk image, for example to write an MBR to
> -          it.
> -
> -      do_stage_partition()
> -          Special content-staging hook called before
> -          do_prepare_partition(), normally empty.
> -
> -          Typically, a partition will just use the passed-in
> -          parameters, for example the unmodified value of bootimg_dir.
> -          In some cases however, things may need to be more tailored.
> -          As an example, certain files may additionally need to be
> -          take from bootimg_dir + /boot.  This hook allows those files
> -          to be staged in a customized fashion.  Note that
> -          get_bitbake_var() allows you to access non-standard
> -          variables that you might want to use for these types of
> -          situations.
> -
> -    This scheme is extensible - adding more hooks is a simple matter
> -    of adding more plugin methods to SourcePlugin and derived classes.
> -    Please see the implementation for details.
> +Copies file or directory to the specified directory
> +on the partition:
> +   $ wic cp test tmp/deploy/images/qemux86-64/
> core-image-minimal-qemux86-64.wic:1/efi/
>  """
>
> -wic_overview_help = """
> -
> -NAME
> -    wic overview - General overview of wic
> -
> -DESCRIPTION
> -    The 'wic' command generates partitioned images from existing
> -    OpenEmbedded build artifacts.  Image generation is driven by
> -    partitioning commands contained in an 'Openembedded kickstart'
> -    (.wks) file (see 'wic help kickstart') specified either directly
> -    on the command-line or as one of a selection of canned .wks files
> -    (see 'wic list images').  When applied to a given set of build
> -    artifacts, the result is an image or set of images that can be
> -    directly written onto media and used on a particular system.
> -
> -    The 'wic' command and the infrastructure it's based on is by
> -    definition incomplete - its purpose is to allow the generation of
> -    customized images, and as such was designed to be completely
> -    extensible via a plugin interface (see 'wic help plugins').
> -
> -  Background and Motivation
> -
> -    wic is meant to be a completely independent standalone utility
> -    that initially provides easier-to-use and more flexible
> -    replacements for a couple bits of existing functionality in
> -    oe-core: directdisk.bbclass and mkefidisk.sh.  The difference
> -    between wic and those examples is that with wic the functionality
> -    of those scripts is implemented by a general-purpose partitioning
> -    'language' based on Redhat kickstart syntax).
> -
> -    The initial motivation and design considerations that lead to the
> -    current tool are described exhaustively in Yocto Bug #3847
> -    (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3847).
> -
> -  Implementation and Examples
> -
> -    wic can be used in two different modes, depending on how much
> -    control the user needs in specifying the Openembedded build
> -    artifacts that will be used in creating the image: 'raw' and
> -    'cooked'.
> -
> -    If used in 'raw' mode, artifacts are explicitly specified via
> -    command-line arguments (see example below).
> -
> -    The more easily usable 'cooked' mode uses the current MACHINE
> -    setting and a specified image name to automatically locate the
> -    artifacts used to create the image.
> -
> -    OE kickstart files (.wks) can of course be specified directly on
> -    the command-line, but the user can also choose from a set of
> -    'canned' .wks files available via the 'wic list images' command
> -    (example below).
> -
> -    In any case, the prerequisite for generating any image is to have
> -    the build artifacts already available.  The below examples assume
> -    the user has already build a 'core-image-minimal' for a specific
> -    machine (future versions won't require this redundant step, but
> -    for now that's typically how build artifacts get generated).
> -
> -    The other prerequisite is to source the build environment:
> -
> -      $ source oe-init-build-env
> -
> -    To start out with, we'll generate an image from one of the canned
> -    .wks files.  The following generates a list of availailable
> -    images:
> -
> -      $ wic list images
> -        mkefidisk             Create an EFI disk image
> -        directdisk            Create a 'pcbios' direct disk image
> -
> -    You can get more information about any of the available images by
> -    typing 'wic list xxx help', where 'xxx' is one of the image names:
> -
> -      $ wic list mkefidisk help
> -
> -    Creates a partitioned EFI disk image that the user can directly dd
> -    to boot media.
> -
> -    At any time, you can get help on the 'wic' command or any
> -    subcommand (currently 'list' and 'create').  For instance, to get
> -    the description of 'wic create' command and its parameters:
> -
> -      $ wic create
> -
> -       Usage:
> -
> -       Create a new OpenEmbedded image
> -
> -       usage: wic create <wks file or image name> [-o <DIRNAME> | ...]
> -            [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
> -            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
> -            [-r, --rootfs-dir] [-b, --bootimg-dir] [-k, --kernel-dir]
> -            [-n, --native-sysroot] [-f, --build-rootfs]
> -
> -       This command creates an OpenEmbedded image based on the 'OE
> -       kickstart commands' found in the <wks file>.
> -
> -       The -o option can be used to place the image in a directory
> -       with a different name and location.
> -
> -       See 'wic help create' for more detailed instructions.
> -       ...
> -
> -    As mentioned in the command, you can get even more detailed
> -    information by adding 'help' to the above:
> -
> -      $ wic help create
> -
> -    So, the easiest way to create an image is to use the -e option
> -    with a canned .wks file.  To use the -e option, you need to
> -    specify the image used to generate the artifacts and you actually
> -    need to have the MACHINE used to build them specified in your
> -    local.conf (these requirements aren't necessary if you aren't
> -    using the -e options.)  Below, we generate a directdisk image,
> -    pointing the process at the core-image-minimal artifacts for the
> -    current MACHINE:
> -
> -      $ wic create directdisk -e core-image-minimal
> -
> -      Checking basic build environment...
> -      Done.
> -
> -      Creating image(s)...
> -
> -      Info: The new image(s) can be found here:
> -      /var/tmp/wic/build/directdisk-201309252350-sda.direct
> -
> -      The following build artifacts were used to create the image(s):
> -
> -      ROOTFS_DIR:      ...
> -      BOOTIMG_DIR:     ...
> -      KERNEL_DIR:      ...
> -      NATIVE_SYSROOT:  ...
> -
> -      The image(s) were created using OE kickstart file:
> -        .../scripts/lib/wic/canned-wks/directdisk.wks
> -
> -    The output shows the name and location of the image created, and
> -    so that you know exactly what was used to generate the image, each
> -    of the artifacts and the kickstart file used.
> -
> -    Similarly, you can create a 'mkefidisk' image in the same way
> -    (notice that this example uses a different machine - because it's
> -    using the -e option, you need to change the MACHINE in your
> -    local.conf):
> -
> -      $ wic create mkefidisk -e core-image-minimal
> -      Checking basic build environment...
> -      Done.
> -
> -      Creating image(s)...
> -
> -      Info: The new image(s) can be found here:
> -         /var/tmp/wic/build/mkefidisk-201309260027-sda.direct
> -
> -      ...
> -
> -    Here's an example that doesn't take the easy way out and manually
> -    specifies each build artifact, along with a non-canned .wks file,
> -    and also uses the -o option to have wic create the output
> -    somewhere other than the default /var/tmp/wic:
> -
> -      $ wic create ./test.wks -o ./out --rootfs-dir
> -      tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
> -      --bootimg-dir tmp/sysroots/qemux86-64/usr/share
> -      --kernel-dir tmp/deploy/images/qemux86-64
> -      --native-sysroot tmp/sysroots/x86_64-linux
> -
> -     Creating image(s)...
> -
> -     Info: The new image(s) can be found here:
> -           out/build/test-201507211313-sda.direct
> -
> -     The following build artifacts were used to create the image(s):
> -       ROOTFS_DIR:                   tmp/work/qemux86_64-poky-
> linux/core-image-minimal/1.0-r0/rootfs
> -       BOOTIMG_DIR:                  tmp/sysroots/qemux86-64/usr/share
> -       KERNEL_DIR:                   tmp/deploy/images/qemux86-64
> -       NATIVE_SYSROOT:               tmp/sysroots/x86_64-linux
> -
> -     The image(s) were created using OE kickstart file:
> -     ./test.wks
> -
> -     Here is a content of test.wks:
>
> -     part /boot --source bootimg-pcbios --ondisk sda --label boot
> --active --align 1024
> -     part / --source rootfs --ondisk sda --fstype=ext3 --label platform
> --align 1024
> +wic_rm_description = """
> +This command removes files or directories from the vfat or ext* partition
> of the
> +partitioned image: wic rm <wic image>:<partition><path>
>
> -     bootloader  --timeout=0  --append="rootwait rootfstype=ext3
> video=vesafb vga=0x318 console=tty0"
> +$wic rm ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-
> 64.wic:1/libutil.c32
>
> -
> -    Finally, here's an example of the actual partition language
> -    commands used to generate the mkefidisk image i.e. these are the
> -    contents of the mkefidisk.wks OE kickstart file:
> -
> -      # short-description: Create an EFI disk image
> -      # long-description: Creates a partitioned EFI disk image that the
> user
> -      # can directly dd to boot media.
> -
> -      part /boot --source bootimg-efi --ondisk sda --fstype=efi --active
> -
> -      part / --source rootfs --ondisk sda --fstype=ext3 --label platform
> -
> -      part swap --ondisk sda --size 44 --label swap1 --fstype=swap
> -
> -      bootloader  --timeout=10  --append="rootwait console=ttyPCH0,115200"
> -
> -    You can get a complete listing and description of all the
> -    kickstart commands available for use in .wks files from 'wic help
> -    kickstart'.
>  """
>
> -wic_kickstart_help = """
> -
> -NAME
> -    wic kickstart - wic kickstart reference
> -
> -DESCRIPTION
> -    This section provides the definitive reference to the wic
> -    kickstart language.  It also provides documentation on the list of
> -    --source plugins available for use from the 'part' command (see
> -    the 'Platform-specific Plugins' section below).
> -
> -    The current wic implementation supports only the basic kickstart
> -    partitioning commands: partition (or part for short) and
> -    bootloader.
> -
> -    The following is a listing of the commands, their syntax, and
> -    meanings. The commands are based on the Fedora kickstart
> -    documentation but with modifications to reflect wic capabilities.
> -
> -      http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
> -      http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader
> -
> -  Commands
> -
> -    * 'part' or 'partition'
> -
> -       This command creates a partition on the system and uses the
> -       following syntax:
> -
> -         part [<mountpoint>]
> -
> -       The <mountpoint> is where the partition will be mounted and
> -       must take of one of the following forms:
> -
> -         /<path>: For example: /, /usr, or /home
> -
> -         swap: The partition will be used as swap space.
> -
> -       If a <mountpoint> is not specified the partition will be created
> -       but will not be mounted.
> -
> -       Partitions with a <mountpoint> specified will be automatically
> mounted.
> -       This is achieved by wic adding entries to the fstab during image
> -       generation. In order for a valid fstab to be generated one of the
> -       --ondrive, --ondisk or --use-uuid partition options must be used
> for
> -       each partition that specifies a mountpoint.
> -
> -
> -       The following are supported 'part' options:
> -
> -         --size: The minimum partition size. Specify an integer value
> -                 such as 500. Multipliers k, M ang G can be used. If
> -                 not specified, the size is in MB.
> -                 You do not need this option if you use --source.
> -
> -         --fixed-size: Exact partition size. Value format is the same
> -                       as for --size option. This option cannot be
> -                       specified along with --size. If partition data
> -                       is larger than --fixed-size and error will be
> -                       raised when assembling disk image.
> -
> -         --source: This option is a wic-specific option that names the
> -                   source of the data that will populate the
> -                   partition.  The most common value for this option
> -                   is 'rootfs', but can be any value which maps to a
> -                   valid 'source plugin' (see 'wic help plugins').
> -
> -                   If '--source rootfs' is used, it tells the wic
> -                   command to create a partition as large as needed
> -                   and to fill it with the contents of the root
> -                   filesystem pointed to by the '-r' wic command-line
> -                   option (or the equivalent rootfs derived from the
> -                   '-e' command-line option).  The filesystem type
> -                   that will be used to create the partition is driven
> -                   by the value of the --fstype option specified for
> -                   the partition (see --fstype below).
> -
> -                   If --source <plugin-name>' is used, it tells the
> -                   wic command to create a partition as large as
> -                   needed and to fill with the contents of the
> -                   partition that will be generated by the specified
> -                   plugin name using the data pointed to by the '-r'
> -                   wic command-line option (or the equivalent rootfs
> -                   derived from the '-e' command-line option).
> -                   Exactly what those contents and filesystem type end
> -                   up being are dependent on the given plugin
> -                   implementation.
> -
> -                   If --source option is not used, the wic command
> -                   will create empty partition. --size parameter has
> -                   to be used to specify size of empty partition.
> +wic_write_description = """
> +This command writes an image to a target device (USB stick, SD card etc)
>
> -         --ondisk or --ondrive: Forces the partition to be created on
> -                                a particular disk.
> -
> -         --fstype: Sets the file system type for the partition.  These
> -           apply to partitions created using '--source rootfs' (see
> -           --source above).  Valid values are:
> -
> -             vfat
> -             msdos
> -             ext2
> -             ext3
> -             ext4
> -             btrfs
> -             squashfs
> -             swap
> -
> -         --fsoptions: Specifies a free-form string of options to be
> -                      used when mounting the filesystem. This string
> -                      will be copied into the /etc/fstab file of the
> -                      installed system and should be enclosed in
> -                      quotes.  If not specified, the default string is
> -                      "defaults".
> -
> -         --label label: Specifies the label to give to the filesystem
> -                        to be made on the partition. If the given
> -                        label is already in use by another filesystem,
> -                        a new label is created for the partition.
> -
> -         --active: Marks the partition as active.
> -
> -         --align (in KBytes): This option is specific to wic and says
> -                              to start a partition on an x KBytes
> -                              boundary.
> -
> -         --no-table: This option is specific to wic. Space will be
> -                     reserved for the partition and it will be
> -                     populated but it will not be added to the
> -                     partition table. It may be useful for
> -                     bootloaders.
> -
> -         --exclude-path: This option is specific to wic. It excludes the
> given
> -                         relative path from the resulting image. If the
> path
> -                         ends with a slash, only the content of the
> directory
> -                         is omitted, not the directory itself. This
> option only
> -                         has an effect with the rootfs source plugin.
> -
> -         --extra-space: This option is specific to wic. It adds extra
> -                        space after the space filled by the content
> -                        of the partition. The final size can go
> -                        beyond the size specified by --size.
> -                        By default, 10MB. This option cannot be used
> -                        with --fixed-size option.
> -
> -         --overhead-factor: This option is specific to wic. The
> -                            size of the partition is multiplied by
> -                            this factor. It has to be greater than or
> -                            equal to 1. The default value is 1.3.
> -                            This option cannot be used with --fixed-size
> -                            option.
> -
> -         --part-name: This option is specific to wic. It specifies name
> for GPT partitions.
> -
> -         --part-type: This option is specific to wic. It specifies
> partition
> -                      type GUID for GPT partitions.
> -                      List of partition type GUIDS can be found here:
> -                      http://en.wikipedia.org/wiki/GUID_Partition_Table#
> Partition_type_GUIDs
> -
> -         --use-uuid: This option is specific to wic. It makes wic to
> generate
> -                     random globally unique identifier (GUID) for the
> partition
> -                     and use it in bootloader configuration to specify
> root partition.
> -
> -         --uuid: This option is specific to wic. It specifies partition
> UUID.
> -                 It's useful if preconfigured partition UUID is added to
> kernel command line
> -                 in bootloader configuration before running wic. In this
> case .wks file can
> -                 be generated or modified to set preconfigured parition
> UUID using this option.
> -
> -         --system-id: This option is specific to wic. It specifies
> partition system id. It's useful
> -                      for the harware that requires non-default partition
> system ids. The parameter
> -                      in one byte long hex number either with 0x prefix
> or without it.
> -
> -         --mkfs-extraopts: This option specifies extra options to pass to
> mkfs utility.
> -                           NOTE, that wic uses default options for some
> filesystems, for example
> -                           '-S 512' for mkfs.fat or '-F -i 8192' for
> mkfs.ext. Those options will
> -                           not take effect when --mkfs-extraopts is used.
> This should be taken into
> -                           account when using --mkfs-extraopts.
> -
> -    * bootloader
> -
> -      This command allows the user to specify various bootloader
> -      options.  The following are supported 'bootloader' options:
> -
> -        --timeout: Specifies the number of seconds before the
> -                   bootloader times out and boots the default option.
> -
> -        --append: Specifies kernel parameters. These will be added to
> -                  bootloader command-line - for example, the syslinux
> -                  APPEND or grub kernel command line.
> -
> -        --configfile: Specifies a user defined configuration file for
> -                      the bootloader. This file must be located in the
> -                      canned-wks folder or could be the full path to the
> -                      file. Using this option will override any other
> -                      bootloader option.
> -
> -      Note that bootloader functionality and boot partitions are
> -      implemented by the various --source plugins that implement
> -      bootloader functionality; the bootloader command essentially
> -      provides a means of modifying bootloader configuration.
> -
> -    * include
> -
> -      This command allows the user to include the content of .wks file
> -      into original .wks file.
> -
> -      Command uses the following syntax:
> -
> -         include <file>
> -
> -      The <file> is either path to the file or its name. If name is
> -      specified wic will try to find file in the directories with canned
> -      .wks files.
> -
> -"""
> +    $ wic write ./tmp/deploy/images/qemux86-
> 64/core-image-minimal-qemux86-64.wic /dev/sdb
>
> -wic_help_help = """
> -NAME
> -    wic help - display a help topic
> +The --expand option is used to resize image partitions.
> +--expand auto expands partitions to occupy all free space available on
> the target device.
> +It's also possible to specify expansion rules in a format
> +<partition>:<size>[-<partition>:<size>...] for one or more partitions.
> +Specifying size 0 will keep partition unmodified.
> +Note: Resizing boot partition can result in non-bootable image for
> non-EFI images. It is
> +recommended to use size 0 for boot partition to keep image bootable.
>
> -DESCRIPTION
> -    Specify a help topic to display it. Topics are shown above.
>  """
> diff --git a/scripts/wic b/scripts/wic
> index 097084a..cb348e3 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -106,7 +106,7 @@ class RootfsArgAction(argparse.Action):
>          namespace.__dict__['rootfs_dir'][key] = rootfs_dir
>
>
> -def wic_create_subcommand(options, usage_str):
> +def wic_create_subcommand(options):
>      """
>      Command-line handling for image creation.  The real work is done
>      by image.engine.wic_create()
> @@ -177,7 +177,7 @@ def wic_create_subcommand(options, usage_str):
>      wks_file = options.wks_file
>
>      if not wks_file.endswith(".wks"):
> -        wks_file = engine.find_canned_image(scripts_path, wks_file)
> +        wks_file = engine.find_canned_image(wks_file)
>          if not wks_file:
>              raise WicError("No image named %s found, exiting.  (Use 'wic
> list images' "
>                             "to list available images, or specify a
> fully-qualified OE "
> @@ -227,91 +227,44 @@ def wic_create_subcommand(options, usage_str):
>                        native_sysroot, options)
>
>
> -def wic_list_subcommand(args, usage_str):
> +def wic_list_subcommand(args):
>      """
>      Command-line handling for listing available images.
>      The real work is done by image.engine.wic_list()
>      """
> -    if not engine.wic_list(args, scripts_path):
> +    if not engine.wic_list(scripts_path, args):
>          raise WicError("Bad list arguments, exiting")
>
>
> -def wic_ls_subcommand(args, usage_str):
> +def wic_ls_subcommand(args):
>      """
>      Command-line handling for list content of images.
>      The real work is done by engine.wic_ls()
>      """
>      engine.wic_ls(args, args.native_sysroot)
>
> -def wic_cp_subcommand(args, usage_str):
> +def wic_cp_subcommand(args):
>      """
>      Command-line handling for copying files/dirs to images.
>      The real work is done by engine.wic_cp()
>      """
>      engine.wic_cp(args, args.native_sysroot)
>
> -def wic_rm_subcommand(args, usage_str):
> +def wic_rm_subcommand(args):
>      """
>      Command-line handling for removing files/dirs from images.
>      The real work is done by engine.wic_rm()
>      """
>      engine.wic_rm(args, args.native_sysroot)
>
> -def wic_write_subcommand(args, usage_str):
> +def wic_write_subcommand(args):
>      """
>      Command-line handling for writing images.
>      The real work is done by engine.wic_write()
>      """
>      engine.wic_write(args, args.native_sysroot)
>
> -def wic_help_subcommand(args, usage_str):
> -    """
> -    Command-line handling for help subcommand to keep the current
> -    structure of the function definitions.
> -    """
> -    pass
> -
>
> -def wic_help_topic_subcommand(usage_str, help_str):
> -    """
> -    Display function for help 'sub-subcommands'.
> -    """
> -    print(help_str)
> -    return
> -
> -
> -wic_help_topic_usage = """
> -"""
> -
> -helptopics = {
> -    "plugins":   [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_plugins_help],
> -    "overview":  [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_overview_help],
> -    "kickstart": [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_kickstart_help],
> -    "create":    [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_create_help],
> -    "ls":        [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_ls_help],
> -    "cp":        [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_cp_help],
> -    "rm":        [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_rm_help],
> -    "write":     [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_write_help],
> -    "list":      [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_list_help]
> -}
>
>
>  def wic_init_parser_create(subparser):
> @@ -333,17 +286,15 @@ def wic_init_parser_create(subparser):
>                        help="path to the dir containing the kernel to use "
>                             "in the .wks bootimg")
>      subparser.add_argument("-n", "--native-sysroot",
> dest="native_sysroot",
> -                      help="path to the native sysroot containing the
> tools "
> -                           "to use to build the image")
> +                      help="path to the native sysroot containing the
> tools (parted and mtools) to use.")
>      subparser.add_argument("-s", "--skip-build-check", dest="build_check",
>                        action="store_false", default=True, help="skip the
> build check")
>      subparser.add_argument("-f", "--build-rootfs", action="store_true",
> help="build rootfs")
>      subparser.add_argument("-c", "--compress-with", choices=("gzip",
> "bzip2", "xz"),
>                        dest='compressor',
>                        help="compress image with specified compressor")
> -    subparser.add_argument("-m", "--bmap", action="store_true",
> help="generate .bmap")
> -    subparser.add_argument("--no-fstab-update" ,action="store_true",
> -                      help="Do not change fstab file.")
> +    subparser.add_argument("-m", "--bmap", action="store_true",
> help="used to produce .bmap file for the image."
> +                           "This file can be used to flash image using
> bmaptool utility")
>      subparser.add_argument("-v", "--vars", dest='vars_dir',
>                        help="directory with <image>.env files that store "
>                             "bitbake variables")
> @@ -357,10 +308,10 @@ def wic_init_parser_list(subparser):
>                          help="can be 'images' or 'source-plugins' "
>                               "to obtain a list. "
>                               "If value is a valid .wks image file")
> -    subparser.add_argument("help_for", default=[], nargs='*',
> +    subparser.add_argument("info_for", default=[], nargs='*',
>                          help="If 'list_type' is a valid .wks image file "
> -                             "this value can be 'help' to show the help
> information "
> -                             "defined inside the .wks file")
> +                             "this value can be 'info' to show the image
> or plugin information ")
> +
>      return
>
>  def imgtype(arg):
> @@ -385,9 +336,9 @@ def imgtype(arg):
>
>  def wic_init_parser_ls(subparser):
>      subparser.add_argument("path", type=imgtype,
> -                        help="image spec: <image>[:<vfat
> partition>[<path>]]")
> +                        help="image spec: <image>[:<partition>[<path>]]")
>      subparser.add_argument("-n", "--native-sysroot",
> -                        help="path to the native sysroot containing the
> tools")
> +                        help="path to the native sysroot containing the
> tools (parted and mtools) to use.")
>
>  def imgpathtype(arg):
>      img = imgtype(arg)
> @@ -399,15 +350,15 @@ def wic_init_parser_cp(subparser):
>      subparser.add_argument("src",
>                          help="source spec")
>      subparser.add_argument("dest", type=imgpathtype,
> -                        help="image spec: <image>:<vfat
> partition>[<path>]")
> +                        help="image spec: <image>:<partition>[<path>]")
>      subparser.add_argument("-n", "--native-sysroot",
> -                        help="path to the native sysroot containing the
> tools")
> +                        help="path to the native sysroot containing the
> tools (parted and mtools) to use.")
>
>  def wic_init_parser_rm(subparser):
>      subparser.add_argument("path", type=imgpathtype,
> -                        help="path: <image>:<vfat partition><path>")
> +                        help="image spec: <image>[:<partition>[<path>]")
>      subparser.add_argument("-n", "--native-sysroot",
> -                        help="path to the native sysroot containing the
> tools")
> +                        help="path to the native sysroot containing the
> tools (parted and mtools) to use.")
>
>  def expandtype(rules):
>      """
> @@ -448,59 +399,56 @@ def wic_init_parser_write(subparser):
>      subparser.add_argument("-e", "--expand", type=expandtype,
>                          help="expand rules: auto or <partition>:<size>[,<
> partition>:<size>]")
>      subparser.add_argument("-n", "--native-sysroot",
> -                        help="path to the native sysroot containing the
> tools")
> -
> -def wic_init_parser_help(subparser):
> -    helpparsers = subparser.add_subparsers(dest='help_topic',
> help=hlp.wic_usage)
> -    for helptopic in helptopics:
> -        helpparsers.add_parser(helptopic, help=helptopics[helptopic][2])
> -    return
> +                        help="path to the native sysroot containing the
> tools (parted and mtools) to use.")
>
>
>  subcommands = {
>      "create":    [wic_create_subcommand,
> -                  hlp.wic_create_usage,
> -                  hlp.wic_create_help,
> -                  wic_init_parser_create],
> +                  hlp.wic_create_description,
> +                  wic_init_parser_create,
> +                  hlp.wic_create_short_description],
>      "list":      [wic_list_subcommand,
> -                  hlp.wic_list_usage,
> -                  hlp.wic_list_help,
> -                  wic_init_parser_list],
> +                  hlp.wic_list_description,
> +                  wic_init_parser_list,
> +                  hlp.wic_list_short_description],
>      "ls":        [wic_ls_subcommand,
> -                  hlp.wic_ls_usage,
> -                  hlp.wic_ls_help,
> -                  wic_init_parser_ls],
> +                  hlp.wic_ls_description,
> +                  wic_init_parser_ls,
> +                  hlp.wic_ls_short_description],
>      "cp":        [wic_cp_subcommand,
> -                  hlp.wic_cp_usage,
> -                  hlp.wic_cp_help,
> -                  wic_init_parser_cp],
> +                  hlp.wic_cp_description,
> +                  wic_init_parser_cp,
> +                  hlp.wic_cp_short_description],
>      "rm":        [wic_rm_subcommand,
> -                  hlp.wic_rm_usage,
> -                  hlp.wic_rm_help,
> -                  wic_init_parser_rm],
> +                  hlp.wic_rm_description,
> +                  wic_init_parser_rm,
> +                  hlp.wic_rm_short_description],
>      "write":     [wic_write_subcommand,
> -                  hlp.wic_write_usage,
> -                  hlp.wic_write_help,
> -                  wic_init_parser_write],
> -    "help":      [wic_help_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_help_help,
> -                  wic_init_parser_help]
> +                  hlp.wic_write_description,
> +                  wic_init_parser_write,
> +                  hlp.wic_write_short_description],
>  }
>
> +def invoke_subcommand(args, parser, main_command_usage, subcommands):
> +        subcmd = subcommands.get(args.command, subcommand_error)
> +        usage = subcmd[1]
> +        subcmd[0](args, usage)
> +
>
>  def init_parser(parser):
>      parser.add_argument("--version", action="version",
>          version="%(prog)s {version}".format(version=__version__))
> -    subparsers = parser.add_subparsers(dest='command',
> help=hlp.wic_usage)
> +    subparsers = parser.add_subparsers(dest='command')
> +    helpparser = subparsers.add_parser("help", help="Display usages")
>      for subcmd in subcommands:
> -        subparser = subparsers.add_parser(subcmd,
> help=subcommands[subcmd][2])
> -        subcommands[subcmd][3](subparser)
> +        subparser = subparsers.add_parser(subcmd,
> help=subcommands[subcmd][3], formatter_class=argparse.RawDescriptionHelpFormatter,
> description=subcommands[subcmd][1])
> +        subcommands[subcmd][2](subparser)
> +
>
>
>  def main(argv):
>      parser = argparse.ArgumentParser(
> -        description="wic version %s" % __version__)
> +        description="Create a customized OpenEmbedded image. Wic version
> %s" % __version__)
>
>      init_parser(parser)
>
> @@ -508,22 +456,15 @@ def main(argv):
>
>      if "command" in vars(args):
>          if args.command == "help":
> -            if args.help_topic is None:
> -                parser.print_help()
> -                print()
> -                print("Please specify a help topic")
> -            elif args.help_topic in helptopics:
> -                hlpt = helptopics[args.help_topic]
> -                hlpt[0](hlpt[1], hlpt[2])
> -            return 0
> -
> -    return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage,
> subcommands)
> -
> +            parser.print_help()
> +            print()
> +        else:
> +            subcmd = subcommands.get(args.command)
> +            subcmd[0](args)
>
>  if __name__ == "__main__":
>      try:
>          sys.exit(main(sys.argv[1:]))
>      except WicError as err:
> -        print()
>          logger.error(err)
>          sys.exit(1)
> --
> 2.7.4
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114387b8b3019c0560234a2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Amber,<div><br></div><div>Can you resend that using git=
-send-email?=C2=A0 Copy/pasting it into a mail client has sent it as HTML, =
which git-apply can&#39;t read.</div><div><br></div><div>Cheers,</div><div>=
Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n 11 December 2017 at 21:25, Elliot, Amber N <span dir=3D"ltr">&lt;<a href=
=3D"mailto:amber.n.elliot@intel.com" target=3D"_blank">amber.n.elliot@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">



<div style=3D"word-wrap:break-word;color:rgb(0,0,0);font-size:14px;font-fam=
ily:Calibri,sans-serif">
<div>
<div>The wic help output formally consisted of manually created strings mix=
ed with argparse,</div>
<div>which was unformatted and unusable. This fix cleans up the help messag=
es, rewrites help</div>
<div>functionality to use argparse, and adds functionality to show informat=
ion for</div>
<div>plugins (similar to canned images).</div>
<div><br>
</div>
<div>Fixes [YOCTO #12205]</div>
<div><br>
</div>
<div>Signed-off-by: anelliot &lt;<a href=3D"mailto:amber.n.elliot@intel.com=
" target=3D"_blank">amber.n.elliot@intel.com</a>&gt;</div>
<div>---</div>
<div>=C2=A0scripts/lib/wic/engine.py | =C2=A0 87 +++-</div>
<div>=C2=A0scripts/lib/wic/help.py =C2=A0 | 1072 +++++---------------------=
----<wbr>---------------</div>
<div>=C2=A0scripts/wic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0169 +++----</div>
<div>=C2=A03 files changed, 243 insertions(+), 1085 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py</di=
v>
<div>index edcfab3..5d1e1d8 100644</div>
<div>--- a/scripts/lib/wic/engine.py</div>
<div>+++ b/scripts/lib/wic/engine.py</div>
<div>@@ -58,6 +58,8 @@ def verify_build_env():</div>
<div>=C2=A0</div>
<div>=C2=A0CANNED_IMAGE_DIR =3D &quot;lib/wic/canned-wks&quot; # relative t=
o scripts</div>
<div>=C2=A0SCRIPTS_CANNED_IMAGE_DIR =3D &quot;scripts/&quot; + CANNED_IMAGE=
_DIR</div>
<div>+SOURCE_PLUGIN_DIR =3D &quot;lib/wic/plugins/source&quot;</div>
<div>+SCRIPTS_SOURCE_PLUGIN_DIR =3D &quot;scripts/&quot; + SOURCE_PLUGIN_DI=
R</div>
<div>=C2=A0WIC_DIR =3D &quot;wic&quot;</div>
<div>=C2=A0</div>
<div>=C2=A0def build_canned_image_list(path):</div>
<div>@@ -76,6 +78,23 @@ def build_canned_image_list(path):</div>
<div>=C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0return canned_wks_layer_dirs</div>
<div>=C2=A0</div>
<div>+def build_source_plugin_list(path)<wbr>:</div>
<div>+ =C2=A0 =C2=A0layers_path =3D get_bitbake_var(&quot;BBLAYERS&quot;)</=
div>
<div>+ =C2=A0 =C2=A0canned_wks_layer_dirs =3D []</div>
<div>+</div>
<div>+ =C2=A0 =C2=A0if layers_path is not None:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0for layer_path in layers_path.split():</d=
iv>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for wks_path in (WIC_DIR, S=
CRIPTS_SOURCE_PLUGIN_DIR):</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpath =3D os.=
path.join(layer_path, wks_path)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.is=
dir(cpath):</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0canned_wks_layer_dirs.append(<wbr>cpath)</div>
<div>+</div>
<div>+ =C2=A0 =C2=A0cpath =3D os.path.join(path, SOURCE_PLUGIN_DIR)</div>
<div>+ =C2=A0 =C2=A0canned_wks_layer_dirs.append(<wbr>cpath)</div>
<div>+</div>
<div>+ =C2=A0 =C2=A0return canned_wks_layer_dirs</div>
<div>+</div>
<div>+</div>
<div>=C2=A0def find_canned_image(scripts_<wbr>path, wks_file):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0Find a .wks file with the given name in the canned=
 files dir.</div>
<div>@@ -95,6 +114,24 @@ def find_canned_image(scripts_<wbr>path, wks_file)=
:</div>
<div>=C2=A0 =C2=A0 =C2=A0return None</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>+def find_source_plugin(scripts_<wbr>path, plugin_file):</div>
<div>+ =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>+ =C2=A0 =C2=A0Find a .py file with the given name in the source plugi=
n dir.</div>
<div>+</div>
<div>+ =C2=A0 =C2=A0Return False if not found</div>
<div>+ =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>+ =C2=A0 =C2=A0layers_source_plugin_dir =3D build_source_plugin_list(<=
wbr>scripts_path)</div>
<div>+</div>
<div>+ =C2=A0 =C2=A0for source_plugin_dir in layers_source_plugin_dir:</div=
>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0for root, dirs, files in os.walk(source_p=
lugin_dir):</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for fname in files:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if fname.ends=
with(&quot;~&quot;) or fname.endswith(&quot;#&quot;):</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0continue</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if fname.ends=
with(&quot;.py&quot;) and plugin_file + &quot;.py&quot; =3D=3D fname:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fullpath =3D os.path.join(source_plugin_<wbr>dir, fname)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return fullpath</div>
<div>+ =C2=A0 =C2=A0return None</div>
<div>+</div>
<div>=C2=A0def list_canned_images(scripts_<wbr>path):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0List the .wks files in the canned image dir, minus=
 the extension.</div>
<div>@@ -119,7 +156,7 @@ def list_canned_images(scripts_<wbr>path):</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0print(&quot; =C2=A0%s\t\t%s&quot; % (basename.ljust(30), desc))</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>-def list_canned_image_help(<wbr>scripts_path, fullpath):</div>
<div>+def list_canned_image_help(<wbr>fullpath):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0List the help and params in the specified canned i=
mage.</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>@@ -139,6 +176,7 @@ def list_canned_image_help(<wbr>scripts_path, full=
path):</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if idx !=3D -1:</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(li=
ne[idx + len(&quot;#:&quot;):].rstrip())</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print()</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break</d=
iv>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>@@ -152,6 +190,29 @@ def list_source_plugins():</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot; =C2=A0%s&quot; % plugin=
)</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>+def list_source_plugins_help(<wbr>fullpath):</div>
<div>+ =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>+ =C2=A0 =C2=A0List the help and params in the specified canned image.=
</div>
<div>+ =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>+ =C2=A0 =C2=A0found =3D False</div>
<div>+ =C2=A0 =C2=A0with open(fullpath) as plugin:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0for line in plugin:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not found:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idx =3D line.=
find(&quot;DESCRIPTION&quot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if idx !=3D -=
1:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0print(line[idx + len(&quot;DESCRIPTION&quot;):].strip())</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0found =3D True</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue</div=
>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not line.strip():</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idx =3D line.find(&quot;#&q=
uot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auth =3D line.find(&quot;AU=
THORS&quot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if idx !=3D -1 and auth =3D=
=3D -1:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(line[id=
x + len(&quot;#:&quot;):].rstrip())</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break</div>
<div>+</div>
<div>+</div>
<div>=C2=A0def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,</d=
iv>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot=
, options):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>@@ -204,7 +265,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, =
kernel_dir,</div>
<div>=C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.info" target=3D"_blank">l=
ogger.info</a>(&quot;The image(s) were created using OE kickstart file:\n =
=C2=A0%s&quot;, wks_file)</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>-def wic_list(args, scripts_path):</div>
<div>+def wic_list(scripts_path, args):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0Print the list of images or source plugins.</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>@@ -218,16 +279,20 @@ def wic_list(args, scripts_path):</div>
<div>=C2=A0 =C2=A0 =C2=A0elif args.list_type =3D=3D &quot;source-plugins&qu=
ot;:</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_source_plugins()</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True</div>
<div>- =C2=A0 =C2=A0elif len(args.help_for) =3D=3D 1 and args.help_for[0] =
=3D=3D &#39;help&#39;:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0wks_file =3D args.list_type</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0fullpath =3D find_canned_image(scripts_<w=
br>path, wks_file)</div>
<div>+ =C2=A0 =C2=A0elif len(args.info_for) =3D=3D 1 and args.info_for[0] =
=3D=3D &#39;info&#39;:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0input_file =3D args.list_type</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fullpath =3D find_canned_image(scripts_<w=
br>path, input_file)</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not fullpath:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicError(&quot;No ima=
ge named %s found, exiting. &quot;</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(Use &#39;wic list images&#39; to list avail=
able images, &quot;</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;or specify a fully-qualified OE kickstart (.=
wks) &quot;</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;filename)&quot; % wks_file)</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0list_canned_image_help(<wbr>scripts_path,=
 fullpath)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fullpath =3D find_source_pl=
ugin(scripts_<wbr>path, input_file)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not fullpath:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicErro=
r(&quot;No image named %s found, exiting. &quot;</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(Use &#39;wic list images&#39;=
 to list available images, &quot;</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;or specify a fully-qualified O=
E kickstart (.wks) &quot;</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;filename)&quot; % input_file)<=
/div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_source_p=
lugins_help(<wbr>fullpath)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_canned_image_help(<wbr=
>fullpath)</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True</div>
<div>=C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0return False</div>
<div>diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py</div>
<div>index 2ac45e0..8230395 100644</div>
<div>--- a/scripts/lib/wic/help.py</div>
<div>+++ b/scripts/lib/wic/help.py</div>
<div>@@ -30,1014 +30,166 @@ import logging</div>
<div>=C2=A0</div>
<div>=C2=A0from wic.pluginbase import PluginMgr, PLUGIN_TYPES</div>
<div>=C2=A0</div>
<div>-logger =3D logging.getLogger(&#39;wic&#39;)</div>
<div>-</div>
<div>-def subcommand_error(args):</div>
<div>- =C2=A0 =C2=A0<a href=3D"http://logger.info" target=3D"_blank">logger=
.info</a>(&quot;invalid subcommand %s&quot;, args[0])</div>
<div>-</div>
<div>-</div>
<div>-def display_help(subcommand, subcommands):</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0Display help for subcommand.</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0if subcommand not in subcommands:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0return False</div>
<div>-</div>
<div>- =C2=A0 =C2=A0hlp =3D subcommands.get(subcommand, subcommand_error)[2=
]</div>
<div>- =C2=A0 =C2=A0if callable(hlp):</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp =3D hlp()</div>
<div>- =C2=A0 =C2=A0pager =3D subprocess.Popen(&#39;less&#39;, stdin=3Dsubp=
rocess.PIPE)</div>
<div>- =C2=A0 =C2=A0pager.communicate(hlp.encode(<wbr>&#39;utf-8&#39;))</di=
v>
<div>-</div>
<div>- =C2=A0 =C2=A0return True</div>
<div>-</div>
<div>-</div>
<div>-def wic_help(args, usage_str, subcommands):</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0Subcommand help dispatcher.</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0if args.help_topic =3D=3D None or not display_help(args=
.help_topic, subcommands):</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0print(usage_str)</div>
<div>-</div>
<div>-</div>
<div>-def get_wic_plugins_help():</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0Combine wic_plugins_help with the help for every known<=
/div>
<div>- =C2=A0 =C2=A0source plugin.</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0result =3D wic_plugins_help</div>
<div>- =C2=A0 =C2=A0for plugin_type in PLUGIN_TYPES:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0result +=3D &#39;\n\n%s PLUGINS\n\n&#39; =
% plugin_type.upper()</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0for name, plugin in PluginMgr.get_plugins=
(plugin_<wbr>type).items():</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result +=3D &quot;\n %s plu=
gin:\n&quot; % name</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if plugin.__doc__:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result +=3D p=
lugin.__doc__</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result +=3D &=
quot;\n =C2=A0 =C2=A0%s is missing docstring\n&quot; % plugin</div>
<div>- =C2=A0 =C2=A0return result</div>
<div>-</div>
<div>-</div>
<div>-def invoke_subcommand(args, parser, main_command_usage, subcommands):=
</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0Dispatch to subcommand handler borrowed from combo-laye=
r.</div>
<div>- =C2=A0 =C2=A0Should use argparse, but has to work in 2.6.</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0if not args.command:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&quot;No subcommand specifie=
d, exiting&quot;)</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0parser.print_help()</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1</div>
<div>- =C2=A0 =C2=A0elif args.command =3D=3D &quot;help&quot;:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_help(args, main_command_usage, subcom=
mands)</div>
<div>- =C2=A0 =C2=A0elif args.command not in subcommands:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&quot;Unsupported subcommand=
 %s, exiting\n&quot;, args.command)</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0parser.print_help()</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1</div>
<div>- =C2=A0 =C2=A0else:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0subcmd =3D subcommands.get(args.command, =
subcommand_error)</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0usage =3D subcmd[1]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0subcmd[0](args, usage)</div>
<div>-</div>
<div>-</div>
<div>-##</div>
<div>+# ##</div>
<div>=C2=A0# wic help and usage strings</div>
<div>=C2=A0##</div>
<div>=C2=A0</div>
<div>-wic_usage =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>- Create a customized OpenEmbedded image</div>
<div>-</div>
<div>- usage: wic [--version] | [--help] | [COMMAND [ARGS]]</div>
<div>-</div>
<div>- Current &#39;wic&#39; commands are:</div>
<div>- =C2=A0 =C2=A0help =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sh=
ow help for command or one of the topics (see below)</div>
<div>- =C2=A0 =C2=A0create =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Create =
a new OpenEmbedded image</div>
<div>- =C2=A0 =C2=A0list =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Li=
st available canned images and source plugins</div>
<div>-</div>
<div>- Help topics:</div>
<div>- =C2=A0 =C2=A0overview =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic overview=
 - General overview of wic</div>
<div>- =C2=A0 =C2=A0plugins =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wic plugins =
- Overview and API</div>
<div>- =C2=A0 =C2=A0kickstart =C2=A0 =C2=A0 =C2=A0 =C2=A0 wic kickstart - w=
ic kickstart reference</div>
<div>-&quot;&quot;&quot;</div>
<div>-</div>
<div>-wic_help_usage =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>- usage: wic help &lt;subcommand&gt;</div>
<div>-</div>
<div>- This command displays detailed help for the specified subcommand.</d=
iv>
<div>-&quot;&quot;&quot;</div>
<div>-</div>
<div>-wic_create_usage =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>- Create a new OpenEmbedded image</div>
<div>-</div>
<div>- usage: wic create &lt;wks file or image name&gt; [-o &lt;DIRNAME&gt;=
 | --outdir &lt;DIRNAME&gt;]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-e | --image-name] [-s, --=
skip-build-check] [-D, --debug]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-r, --rootfs-dir] [-b, --b=
ootimg-dir]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-k, --kernel-dir] [-n, --n=
ative-sysroot] [-f, --build-rootfs]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-c, --compress-with] [-m, =
--bmap]</div>
<div>-</div>
<div>- This command creates an OpenEmbedded image based on the &#39;OE kick=
start</div>
<div>- commands&#39; found in the &lt;wks file&gt;.</div>
<div>-</div>
<div>- The -o option can be used to place the image in a directory with a</=
div>
<div>- different name and location.</div>
<div>-</div>
<div>- See &#39;wic help create&#39; for more detailed instructions.</div>
<div>-&quot;&quot;&quot;</div>
<div>-</div>
<div>-wic_create_help =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic create - Create a new OpenEmbedded image</div>
<div>-</div>
<div>-SYNOPSIS</div>
<div>- =C2=A0 =C2=A0wic create &lt;wks file or image name&gt; [-o &lt;DIRNA=
ME&gt; | --outdir &lt;DIRNAME&gt;]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0[-e | --image-name] [-s, --skip-build-che=
ck] [-D, --debug]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0[-r, --rootfs-dir] [-b, --bootimg-dir]</d=
iv>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0[-k, --kernel-dir] [-n, --native-sysroot]=
 [-f, --build-rootfs]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0[-c, --compress-with] [-m, --bmap] [--no-=
fstab-update]</div>
<div>-</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0This command creates an OpenEmbedded image based on the=
 &#39;OE</div>
<div>- =C2=A0 =C2=A0kickstart commands&#39; found in the &lt;wks file&gt;.<=
/div>
<div>-</div>
<div>- =C2=A0 =C2=A0In order to do this, wic needs to know the locations of=
 the</div>
<div>- =C2=A0 =C2=A0various build artifacts required to build the image.</d=
iv>
<div>-</div>
<div>- =C2=A0 =C2=A0Users can explicitly specify the build artifact locatio=
ns using</div>
<div>- =C2=A0 =C2=A0the -r, -b, -k, and -n options.=C2=A0 See below for det=
ails on where</div>
<div>- =C2=A0 =C2=A0the corresponding artifacts are typically found in a no=
rmal</div>
<div>- =C2=A0 =C2=A0OpenEmbedded build.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0Alternatively, users can use the -e option to have &#39=
;wic&#39; determine</div>
<div>- =C2=A0 =C2=A0those locations for a given image.=C2=A0 If the -e opti=
on is used, the</div>
<div>- =C2=A0 =C2=A0user needs to have set the appropriate MACHINE variable=
 in</div>
<div>- =C2=A0 =C2=A0local.conf, and have sourced the build environment.</di=
v>
<div>-</div>
<div>- =C2=A0 =C2=A0The -e option is used to specify the name of the image =
to use the</div>
<div>- =C2=A0 =C2=A0artifacts from e.g. core-image-sato.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -r option is used to specify the path to the /rootf=
s dir to</div>
<div>- =C2=A0 =C2=A0use as the .wks rootfs source.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -b option is used to specify the path to the dir co=
ntaining</div>
<div>- =C2=A0 =C2=A0the boot artifacts (e.g. /EFI or /syslinux dirs) to use=
 as the</div>
<div>- =C2=A0 =C2=A0.wks bootimg source.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -k option is used to specify the path to the dir co=
ntaining</div>
<div>- =C2=A0 =C2=A0the kernel to use in the .wks bootimg.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -n option is used to specify the path to the native=
 sysroot</div>
<div>- =C2=A0 =C2=A0containing the tools to use to build the image.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -f option is used to build rootfs by running &quot;=
bitbake &lt;image&gt;&quot;</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -s option is used to skip the build check.=C2=A0 Th=
e build check is</div>
<div>- =C2=A0 =C2=A0a simple sanity check used to determine whether the use=
r has</div>
<div>- =C2=A0 =C2=A0sourced the build environment so that the -e option can=
 operate</div>
<div>- =C2=A0 =C2=A0correctly.=C2=A0 If the user has specified the build ar=
tifact locations</div>
<div>- =C2=A0 =C2=A0explicitly, &#39;wic&#39; assumes the user knows what h=
e or she is doing</div>
<div>- =C2=A0 =C2=A0and skips the build check.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -D option is used to display debug information deta=
iling</div>
<div>- =C2=A0 =C2=A0exactly what happens behind the scenes when a create re=
quest is</div>
<div>- =C2=A0 =C2=A0fulfilled (or not, as the case may be).=C2=A0 It enumer=
ates and</div>
<div>- =C2=A0 =C2=A0displays the command sequence used, and should be inclu=
ded in any</div>
<div>- =C2=A0 =C2=A0bug report describing unexpected results.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0When &#39;wic -e&#39; is used, the locations for the bu=
ild artifacts</div>
<div>- =C2=A0 =C2=A0values are determined by &#39;wic -e&#39; from the outp=
ut of the &#39;bitbake</div>
<div>- =C2=A0 =C2=A0-e&#39; command given an image name e.g. &#39;core-imag=
e-minimal&#39; and a</div>
<div>- =C2=A0 =C2=A0given machine set in local.conf.=C2=A0 In that case, th=
e image is</div>
<div>- =C2=A0 =C2=A0created as if the following &#39;bitbake -e&#39; variab=
les were used:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0-r: =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_ROOTFS</div>
<div>- =C2=A0 =C2=A0-k: =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_KERNEL_DIR</div>
<div>- =C2=A0 =C2=A0-n: =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_DIR_NATIVE</div>
<div>- =C2=A0 =C2=A0-b: =C2=A0 =C2=A0 =C2=A0 =C2=A0empty (plugin-specific h=
andlers must determine this)</div>
<div>-</div>
<div>- =C2=A0 =C2=A0If &#39;wic -e&#39; is not used, the user needs to sele=
ct the appropriate</div>
<div>- =C2=A0 =C2=A0value for -b (as well as -r, -k, and -n).</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -o option can be used to place the image in a direc=
tory with a</div>
<div>- =C2=A0 =C2=A0different name and location.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -c option is used to specify compressor utility to =
compress</div>
<div>- =C2=A0 =C2=A0an image. gzip, bzip2 and xz compressors are supported.=
</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -m option is used to produce .bmap file for the ima=
ge. This file</div>
<div>- =C2=A0 =C2=A0can be used to flash image using bmaptool utility.</div=
>
<div>-</div>
<div>- =C2=A0 =C2=A0The --no-fstab-update option is used to doesn&#39;t cha=
nge fstab file. When</div>
<div>- =C2=A0 =C2=A0using this option the final fstab file will be same tha=
t in rootfs and</div>
<div>- =C2=A0 =C2=A0wic doesn&#39;t update file, e.g adding a new mount poi=
nt. User can control</div>
<div>- =C2=A0 =C2=A0the fstab file content in base-files recipe.</div>
<div>-&quot;&quot;&quot;</div>
<div>-</div>
<div>-wic_list_usage =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>- List available OpenEmbedded images and source plugins</div>
<div>-</div>
<div>- usage: wic list images</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0wic list &lt;image&gt; help</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0wic list source-plugins</div>
<div>-</div>
<div>- This command enumerates the set of available canned images as well a=
s</div>
<div>- help for those images.=C2=A0 It also can be used to list of availabl=
e source</div>
<div>- plugins.</div>
<div>-</div>
<div>- The first form enumerates all the available &#39;canned&#39; images.=
</div>
<div>-</div>
<div>- The second form lists the detailed help information for a specific</=
div>
<div>- &#39;canned&#39; image.</div>
<div>-</div>
<div>- The third form enumerates all the available --sources (source</div>
<div>- plugins).</div>
<div>-</div>
<div>- See &#39;wic help list&#39; for more details.</div>
<div>+wic_create_short_description =3D &quot;&quot;&quot;</div>
<div>+Create a new OpenEmbedded image.</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_list_help =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic list - List available OpenEmbedded images and sourc=
e plugins</div>
<div>-</div>
<div>-SYNOPSIS</div>
<div>- =C2=A0 =C2=A0wic list images</div>
<div>- =C2=A0 =C2=A0wic list &lt;image&gt; help</div>
<div>- =C2=A0 =C2=A0wic list source-plugins</div>
<div>-</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0This command enumerates the set of available canned ima=
ges as well</div>
<div>- =C2=A0 =C2=A0as help for those images.=C2=A0 It also can be used to =
list available</div>
<div>- =C2=A0 =C2=A0source plugins.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The first form enumerates all the available &#39;canned=
&#39; images.</div>
<div>- =C2=A0 =C2=A0These are actually just the set of .wks files that have=
 been moved</div>
<div>- =C2=A0 =C2=A0into the /scripts/lib/wic/canned-wks directory).</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The second form lists the detailed help information for=
 a specific</div>
<div>- =C2=A0 =C2=A0&#39;canned&#39; image.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The third form enumerates all the available --sources (=
source</div>
<div>- =C2=A0 =C2=A0plugins).=C2=A0 The contents of a given partition are d=
riven by code</div>
<div>- =C2=A0 =C2=A0defined in &#39;source plugins&#39;.=C2=A0 Users specif=
y a specific plugin via</div>
<div>- =C2=A0 =C2=A0the --source parameter of the partition .wks command.=
=C2=A0 Normally</div>
<div>- =C2=A0 =C2=A0this is the &#39;rootfs&#39; plugin but can be any of t=
he more specialized</div>
<div>- =C2=A0 =C2=A0sources listed by the &#39;list source-plugins&#39; com=
mand.=C2=A0 Users can</div>
<div>- =C2=A0 =C2=A0also add their own source plugins - see &#39;wic help p=
lugins&#39; for</div>
<div>- =C2=A0 =C2=A0details.</div>
<div>+wic_rm_short_description =3D &quot;&quot;&quot;</div>
<div>+Remove files or directories from the vfat or ext* partitions.</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_ls_usage =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>- List content of a partitioned image</div>
<div>-</div>
<div>- usage: wic ls &lt;image&gt;[:&lt;partition&gt;[&lt;path&gt;]] [--nat=
ive-sysroot &lt;path&gt;]</div>
<div>-</div>
<div>- This command =C2=A0outputs either list of image partitions or direct=
ory contents</div>
<div>- of vfat and ext* partitions.</div>
<div>-</div>
<div>- See &#39;wic help ls&#39; for more detailed instructions.</div>
<div>-</div>
<div>+wic_write_short_description =3D &quot;&quot;&quot;</div>
<div>+Write an image to a device.</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_ls_help =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic ls - List contents of partitioned image or partitio=
n</div>
<div>-</div>
<div>-SYNOPSIS</div>
<div>- =C2=A0 =C2=A0wic ls &lt;image&gt;</div>
<div>- =C2=A0 =C2=A0wic ls &lt;image&gt;:&lt;vfat or ext* partition&gt;</di=
v>
<div>- =C2=A0 =C2=A0wic ls &lt;image&gt;:&lt;vfat or ext* partition&gt;&lt;=
path&gt;</div>
<div>- =C2=A0 =C2=A0wic ls &lt;image&gt;:&lt;vfat or ext* partition&gt;&lt;=
path&gt; --native-sysroot &lt;path&gt;</div>
<div>-</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0This command lists either partitions of the image or di=
rectory contents</div>
<div>- =C2=A0 =C2=A0of vfat or ext* partitions.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The first form it lists partitions of the image.</div>
<div>- =C2=A0 =C2=A0For example:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0$ wic ls tmp/deploy/images/qemux86-64/<wb=
r>core-image-minimal-qemux86-64.<wbr>wic</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Num =C2=A0 =C2=A0 Start =C2=A0 =C2=A0 =C2=
=A0 =C2=A0End =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Size =C2=A0 =C2=A0 =C2=A0Fs=
type</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A01 =C2=A0 =C2=A0 =C2=A0 =C2=A01048576 =C2=
=A0 =C2=A0 24438783 =C2=A0 =C2=A0 23390208 =C2=A0fat16</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A02 =C2=A0 =C2=A0 =C2=A0 25165824 =C2=A0 =
=C2=A0 50315263 =C2=A0 =C2=A0 25149440 =C2=A0ext4</div>
<div>-</div>
<div>- =C2=A0 =C2=A0Second and third form list directory content of the par=
tition:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0$ wic ls tmp/deploy/images/qemux86-64/<wb=
r>core-image-minimal-qemux86-64.<wbr>wic:1</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Volume in drive : is boot</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 Volume Serial Number is 2DF2-5F02</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Directory for ::/</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0efi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt=
;DIR&gt; =C2=A0 =C2=A0 2017-05-11 =C2=A010:54</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0startup =C2=A0nsh =C2=A0 =C2=A0 =C2=A0 =
=C2=A026 2017-05-11 =C2=A010:54</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinuz =C2=A0 =C2=A0 =C2=A0 =C2=A0692228=
8 2017-05-11 =C2=A010:54</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 files =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 922 314 bytes</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15 818 752 bytes free</div>
<div>-</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0$ wic ls tmp/deploy/images/qemux86-64/<wb=
r>core-image-minimal-qemux86-64.<wbr>wic:1/EFI/boot/</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Volume in drive : is boot</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 Volume Serial Number is 2DF2-5F02</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Directory for ::/EFI/boot</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;DIR&gt; =C2=A0 =C2=A0 2017-05-11 =C2=A010:54</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0.. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt=
;DIR&gt; =C2=A0 =C2=A0 2017-05-11 =C2=A010:54</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0grub =C2=A0 =C2=A0 cfg =C2=A0 =C2=A0 =C2=
=A0 679 2017-05-11 =C2=A010:54</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0bootx64 =C2=A0efi =C2=A0 =C2=A0571392 201=
7-05-11 =C2=A010:54</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04 files =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 572 071 bytes</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15 818 752 bytes free</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -n option is used to specify the path to the native=
 sysroot</div>
<div>- =C2=A0 =C2=A0containing the tools(parted and mtools) to use.</div>
<div>-</div>
<div>-&quot;&quot;&quot;</div>
<div>-</div>
<div>-wic_cp_usage =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>- Copy files and directories to the vfat or ext* partition</div>
<div>-</div>
<div>- usage: wic cp &lt;src&gt; &lt;image&gt;:&lt;partition&gt;[&lt;path&g=
t;] [--native-sysroot &lt;path&gt;]</div>
<div>-</div>
<div>- This command =C2=A0copies local files or directories to the vfat or =
ext* partitions</div>
<div>-of partitioned =C2=A0image.</div>
<div>-</div>
<div>- See &#39;wic help cp&#39; for more detailed instructions.</div>
<div>-</div>
<div>+wic_cp_short_description =3D &quot;&quot;&quot;</div>
<div>+Copy files and directories to the vfat or ext* partitions.</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_cp_help =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic cp - copy files and directories to the vfat or ext*=
 partitions</div>
<div>-</div>
<div>-SYNOPSIS</div>
<div>- =C2=A0 =C2=A0wic cp &lt;src&gt; &lt;image&gt;:&lt;partition&gt;</div=
>
<div>- =C2=A0 =C2=A0wic cp &lt;src&gt; &lt;image&gt;:&lt;partition&gt;&lt;p=
ath&gt;</div>
<div>- =C2=A0 =C2=A0wic cp &lt;src&gt; &lt;image&gt;:&lt;partition&gt;&lt;p=
ath&gt; --native-sysroot &lt;path&gt;</div>
<div>-</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0This command copies files and directories to the vfat o=
r ext* partition of</div>
<div>- =C2=A0 =C2=A0the partitioned image.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The first form of it copies file or directory to the ro=
ot directory of</div>
<div>- =C2=A0 =C2=A0the partition:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0$ wic cp test.wks tmp/deploy/images/qemux=
86-64/<wbr>core-image-minimal-qemux86-64.<wbr>wic:1</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0$ wic ls tmp/deploy/images/qemux86-64/<wb=
r>core-image-minimal-qemux86-64.<wbr>wic:1</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Volume in drive : is boot</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 Volume Serial Number is DB4C-FD4C</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Directory for ::/</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0efi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt=
;DIR&gt; =C2=A0 =C2=A0 2017-05-24 =C2=A018:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0loader =C2=A0 =C2=A0 =C2=A0 &lt;DIR&gt; =
=C2=A0 =C2=A0 2017-05-24 =C2=A018:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0startup =C2=A0nsh =C2=A0 =C2=A0 =C2=A0 =
=C2=A026 2017-05-24 =C2=A018:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinuz =C2=A0 =C2=A0 =C2=A0 =C2=A0692638=
4 2017-05-24 =C2=A018:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0test =C2=A0 =C2=A0 wks =C2=A0 =C2=A0 =C2=
=A0 628 2017-05-24 =C2=A021:22</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05 files =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 927 038 bytes</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15 677 440 bytes free</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The second form of the command copies file or directory=
 to the specified directory</div>
<div>- =C2=A0 =C2=A0on the partition:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 $ wic cp test tmp/deploy/images/qemux86-64/<wbr=
>core-image-minimal-qemux86-64.<wbr>wic:1/efi/</div>
<div>- =C2=A0 =C2=A0 =C2=A0 $ wic ls tmp/deploy/images/qemux86-64/<wbr>core=
-image-minimal-qemux86-64.<wbr>wic:1/efi/</div>
<div>- =C2=A0 =C2=A0 =C2=A0 Volume in drive : is boot</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Volume Serial Number is DB4C-FD4C</div>
<div>- =C2=A0 =C2=A0 =C2=A0 Directory for ::/efi</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 . =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;=
DIR&gt; =C2=A0 =C2=A0 2017-05-24 =C2=A018:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 .. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;DIR&g=
t; =C2=A0 =C2=A0 2017-05-24 =C2=A018:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 boot =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;DIR&gt; =
=C2=A0 =C2=A0 2017-05-24 =C2=A018:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 test =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;DIR&gt; =
=C2=A0 =C2=A0 2017-05-24 =C2=A021:27</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 files =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 bytes</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015 675 392 bytes free</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The -n option is used to specify the path to the native=
 sysroot</div>
<div>- =C2=A0 =C2=A0containing the tools(parted and mtools) to use.</div>
<div>+wic_ls_short_description =3D &quot;&quot;&quot;</div>
<div>+Lists either partitions of the image or directory contents</div>
<div>+of vfat or ext* partitions.&quot;&quot;&quot;</div>
<div>+wic_help_short_description =3D &quot;&quot;&quot;</div>
<div>+sss</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>-</div>
<div>-wic_rm_usage =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>- Remove files or directories from the vfat or ext* partitions</div>
<div>-</div>
<div>- usage: wic rm &lt;image&gt;:&lt;partition&gt;&lt;path&gt; [--native-=
sysroot &lt;path&gt;]</div>
<div>-</div>
<div>- This command =C2=A0removes files or directories from the vfat or ext=
* partitions of</div>
<div>- the partitioned image.</div>
<div>-</div>
<div>- See &#39;wic help rm&#39; for more detailed instructions.</div>
<div>-</div>
<div>+wic_list_short_description =3D &quot;&quot;&quot;</div>
<div>+List available canned images and source plugins</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_rm_help =3D &quot;&quot;&quot;</div>
<div>+wic_create_description =3D &quot;&quot;&quot;</div>
<div>+This command creates an OpenEmbedded image based on the &#39;OE</div>
<div>+kickstart commands&#39; found in the &lt;wks file&gt;.</div>
<div>=C2=A0</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic rm - remove files or directories from the vfat or e=
xt* partitions</div>
<div>+In order to do this, wic needs to know the locations of the</div>
<div>+various build artifacts required to build the image.</div>
<div>=C2=A0</div>
<div>-SYNOPSIS</div>
<div>- =C2=A0 =C2=A0wic rm &lt;src&gt; &lt;image&gt;:&lt;partition&gt;&lt;p=
ath&gt;</div>
<div>- =C2=A0 =C2=A0wic rm &lt;src&gt; &lt;image&gt;:&lt;partition&gt;&lt;p=
ath&gt; --native-sysroot &lt;path&gt;</div>
<div>+Users can explicitly specify the build artifact locations using</div>
<div>+the -r, -b, -k, and -n options.=C2=A0 See below for details on where<=
/div>
<div>+the corresponding artifacts are typically found in a normal</div>
<div>+OpenEmbedded build.</div>
<div>=C2=A0</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0This command removes files or directories from the vfat=
 or ext* partition of the</div>
<div>- =C2=A0 =C2=A0partitioned image:</div>
<div>+Alternatively, users can use the -e option to have &#39;wic&#39; dete=
rmine</div>
<div>+those locations for a given image.=C2=A0 If the -e option is used, th=
e</div>
<div>+user needs to have set the appropriate MACHINE variable in</div>
<div>+local.conf, and have sourced the build environment.</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0$ wic ls ./tmp/deploy/images/qemux86-<wbr=
>64/core-image-minimal-qemux86-<wbr>64.wic:1</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Volume in drive : is boot</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 Volume Serial Number is 11D0-DE21</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Directory for ::/</div>
<div>+The -s option is used to skip the build check.=C2=A0 The build check =
is</div>
<div>+a simple sanity check used to determine whether the user has</div>
<div>+sourced the build environment so that the -e option can operate</div>
<div>+correctly.=C2=A0 If the user has specified the build artifact locatio=
ns</div>
<div>+explicitly, &#39;wic&#39; assumes the user knows what he or she is do=
ing</div>
<div>+and skips the build check.</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0libcom32 c32 =C2=A0 =C2=A0186500 2017-06-=
02 =C2=A015:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0libutil =C2=A0c32 =C2=A0 =C2=A0 24148 201=
7-06-02 =C2=A015:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0syslinux cfg =C2=A0 =C2=A0 =C2=A0 209 201=
7-06-02 =C2=A015:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0vesamenu c32 =C2=A0 =C2=A0 27104 2017-06-=
02 =C2=A015:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinuz =C2=A0 =C2=A0 =C2=A0 =C2=A0692638=
4 2017-06-02 =C2=A015:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05 files =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 164 345 bytes</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16 582 656 bytes free</div>
<div>+When &#39;wic -e&#39; is used, the locations for the build artifacts<=
/div>
<div>+values are determined by &#39;wic -e&#39; from the output of the &#39=
;bitbake</div>
<div>+-e&#39; command given an image name e.g. &#39;core-image-minimal&#39;=
 and a</div>
<div>+given machine set in local.conf.=C2=A0 In that case, the image is</di=
v>
<div>+created as if the following &#39;bitbake -e&#39; variables were used:=
</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0$ wic rm ./tmp/deploy/images/qemux86-<wbr=
>64/core-image-minimal-qemux86-<wbr>64.wic:1/libutil.c32</div>
<div>+-r: =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_ROOTFS</div>
<div>+-k: =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_KERNEL_DIR</div>
<div>+-n: =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_DIR_NATIVE</div>
<div>+-b: =C2=A0 =C2=A0 =C2=A0 =C2=A0empty (plugin-specific handlers must d=
etermine this)</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0$ wic ls ./tmp/deploy/images/qemux86-<wbr=
>64/core-image-minimal-qemux86-<wbr>64.wic:1</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Volume in drive : is boot</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 Volume Serial Number is 11D0-DE21</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0Directory for ::/</div>
<div>+If &#39;wic -e&#39; is not used, the user needs to select the appropr=
iate</div>
<div>+value for -b (as well as -r, -k, and -n).</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0libcom32 c32 =C2=A0 =C2=A0186500 2017-06-=
02 =C2=A015:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0syslinux cfg =C2=A0 =C2=A0 =C2=A0 209 201=
7-06-02 =C2=A015:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0vesamenu c32 =C2=A0 =C2=A0 27104 2017-06-=
02 =C2=A015:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinuz =C2=A0 =C2=A0 =C2=A0 =C2=A0692638=
4 2017-06-02 =C2=A015:15</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04 files =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 140 197 bytes</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16 607 232 bytes free</div>
<div>+Here&#39;s an example that doesn&#39;t take the easy way out and manu=
ally</div>
<div>+specifies each build artifact, along with a non-canned .wks file,</di=
v>
<div>+and also uses the -o option to have wic create the output</div>
<div>+somewhere other than the default /var/tmp/wic:</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0The -n option is used to specify the path to the native=
 sysroot</div>
<div>- =C2=A0 =C2=A0containing the tools(parted and mtools) to use.</div>
<div>+ =C2=A0$ wic create ./test.wks -o ./out --rootfs-dir</div>
<div>+ =C2=A0tmp/work/qemux86_64-poky-<wbr>linux/core-image-minimal/1.0-<wb=
r>r0/rootfs</div>
<div>+ =C2=A0--bootimg-dir tmp/sysroots/qemux86-64/usr/<wbr>share</div>
<div>+ =C2=A0--kernel-dir tmp/deploy/images/qemux86-64</div>
<div>+ =C2=A0--native-sysroot tmp/sysroots/x86_64-linux</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_write_usage =3D &quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>- Write image to a device</div>
<div>+wic_list_description =3D &quot;&quot;&quot;</div>
<div>+This command enumerates the set of available canned images as well</d=
iv>
<div>+as help for those images.=C2=A0 It also can be used to list available=
</div>
<div>+source plugins.</div>
<div>=C2=A0</div>
<div>- usage: wic write &lt;image&gt; &lt;target device&gt; [--expand [rule=
s]] [--native-sysroot &lt;path&gt;]</div>
<div>+The first form enumerates all the available &#39;canned&#39; images.<=
/div>
<div>+These are actually just the set of .wks files that have been moved</d=
iv>
<div>+into the /scripts/lib/wic/canned-wks directory).</div>
<div>=C2=A0</div>
<div>- This command writes partitioned image to a target device (USB stick,=
 SD card etc).</div>
<div>-</div>
<div>- See &#39;wic help write&#39; for more detailed instructions.</div>
<div>+The second form lists the detailed help information for a specific</d=
iv>
<div>+&#39;canned&#39; image.</div>
<div>=C2=A0</div>
<div>+The third form enumerates all the available --sources (source</div>
<div>+plugins).=C2=A0 The contents of a given partition are driven by code<=
/div>
<div>+defined in &#39;source plugins&#39;.=C2=A0 Users specify a specific p=
lugin via</div>
<div>+the --source parameter of the partition .wks command.=C2=A0 Normally<=
/div>
<div>+this is the &#39;rootfs&#39; plugin but can be any of the more specia=
lized</div>
<div>+sources listed by the &#39;list source-plugins&#39; command.=C2=A0 Us=
ers can</div>
<div>+also add their own source plugins - see &#39;wic help plugins&#39; fo=
r</div>
<div>+details.</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_write_help =3D &quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic write - write an image to a device</div>
<div>+wic_ls_description =3D &quot;&quot;&quot;</div>
<div>+This command lists either partitions of the image or directory conten=
ts</div>
<div>+of vfat or ext* partitions.</div>
<div>=C2=A0</div>
<div>-SYNOPSIS</div>
<div>- =C2=A0 =C2=A0wic write &lt;image&gt; &lt;target&gt;</div>
<div>- =C2=A0 =C2=A0wic write &lt;image&gt; &lt;target&gt; --expand auto</d=
iv>
<div>- =C2=A0 =C2=A0wic write &lt;image&gt; &lt;target&gt; --expand 1:100M-=
2:300M</div>
<div>- =C2=A0 =C2=A0wic write &lt;image&gt; &lt;target&gt; --native-sysroot=
 &lt;path&gt;</div>
<div>+The first form lists partitions of the image.</div>
<div>+For example:</div>
<div>+ =C2=A0 =C2=A0$ wic ls tmp/deploy/images/qemux86-64/<wbr>core-image-m=
inimal-qemux86-64.<wbr>wic</div>
<div>+ =C2=A0 =C2=A0Num =C2=A0 =C2=A0 Start =C2=A0 =C2=A0 =C2=A0 =C2=A0End =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Size =C2=A0 =C2=A0 =C2=A0Fstype</div>
<div>+ =C2=A0 =C2=A01 =C2=A0 =C2=A0 =C2=A0 =C2=A01048576 =C2=A0 =C2=A0 2443=
8783 =C2=A0 =C2=A0 23390208 =C2=A0fat16</div>
<div>+ =C2=A0 =C2=A02 =C2=A0 =C2=A0 =C2=A0 25165824 =C2=A0 =C2=A0 50315263 =
=C2=A0 =C2=A0 25149440 =C2=A0ext4</div>
<div>=C2=A0</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0This command writes an image to a target device (USB st=
ick, SD card etc)</div>
<div>+The second form lists directory contents of the first partition:</div=
>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0$ wic write ./tmp/deploy/images/qemux86-<=
wbr>64/core-image-minimal-qemux86-<wbr>64.wic /dev/sdb</div>
<div>+ =C2=A0 =C2=A0$ wic ls tmp/deploy/images/qemux86-64/<wbr>core-image-m=
inimal-qemux86-64.<wbr>wic:1/EFI/boot/</div>
<div>+ =C2=A0 =C2=A0Volume in drive : is boot</div>
<div>+ =C2=A0 =C2=A0 Volume Serial Number is 2DF2-5F02</div>
<div>+ =C2=A0 =C2=A0Directory for ::/EFI/boot</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0The --expand option is used to resize image partitions.=
</div>
<div>- =C2=A0 =C2=A0--expand auto expands partitions to occupy all free spa=
ce available on the target device.</div>
<div>- =C2=A0 =C2=A0It&#39;s also possible to specify expansion rules in a =
format</div>
<div>- =C2=A0 =C2=A0&lt;partition&gt;:&lt;size&gt;[-&lt;<wbr>partition&gt;:=
&lt;size&gt;...] for one or more partitions.</div>
<div>- =C2=A0 =C2=A0Specifying size 0 will keep partition unmodified.</div>
<div>- =C2=A0 =C2=A0Note: Resizing boot partition can result in non-bootabl=
e image for non-EFI images. It is</div>
<div>- =C2=A0 =C2=A0recommended to use size 0 for boot partition to keep im=
age bootable.</div>
<div>+ =C2=A0 =C2=A0. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;DIR&gt; =
=C2=A0 =C2=A0 2017-05-11 =C2=A010:54</div>
<div>+ =C2=A0 =C2=A0.. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;DIR&gt; =C2=
=A0 =C2=A0 2017-05-11 =C2=A010:54</div>
<div>+ =C2=A0 =C2=A0grub =C2=A0 =C2=A0 cfg =C2=A0 =C2=A0 =C2=A0 679 2017-05=
-11 =C2=A010:54</div>
<div>+ =C2=A0 =C2=A0bootx64 =C2=A0efi =C2=A0 =C2=A0571392 2017-05-11 =C2=A0=
10:54</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04 files =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 572 071 bytes</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15 818 752 bytes free</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0The --native-sysroot option is used to specify the path=
 to the native sysroot</div>
<div>- =C2=A0 =C2=A0containing the tools(parted, resize2fs) to use.</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_plugins_help =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic plugins - Overview and API</div>
<div>-</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0plugins allow wic functionality to be extended and spec=
ialized by</div>
<div>- =C2=A0 =C2=A0users.=C2=A0 This section documents the plugin interfac=
e, which is</div>
<div>- =C2=A0 =C2=A0currently restricted to &#39;source&#39; plugins.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0&#39;Source&#39; plugins provide a mechanism to customi=
ze various aspects</div>
<div>- =C2=A0 =C2=A0of the image generation process in wic, mainly the cont=
ents of</div>
<div>- =C2=A0 =C2=A0partitions.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0Source plugins provide a mechanism for mapping values s=
pecified in</div>
<div>- =C2=A0 =C2=A0.wks files using the --source keyword to a particular p=
lugin</div>
<div>- =C2=A0 =C2=A0implementation that populates a corresponding partition=
.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0A source plugin is created as a subclass of SourcePlugi=
n (see</div>
<div>- =C2=A0 =C2=A0scripts/lib/wic/pluginbase.<wbr>py) and the plugin file=
 containing it</div>
<div>- =C2=A0 =C2=A0is added to scripts/lib/wic/plugins/<wbr>source/ to mak=
e the plugin</div>
<div>- =C2=A0 =C2=A0implementation available to the wic implementation.</di=
v>
<div>-</div>
<div>- =C2=A0 =C2=A0Source plugins can also be implemented and added by ext=
ernal</div>
<div>- =C2=A0 =C2=A0layers - any plugins found in a scripts/lib/wic/plugins=
/<wbr>source/</div>
<div>- =C2=A0 =C2=A0directory in an external layer will also be made availa=
ble.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0When the wic implementation needs to invoke a partition=
-specific</div>
<div>- =C2=A0 =C2=A0implementation, it looks for the plugin that has the sa=
me name as</div>
<div>- =C2=A0 =C2=A0the --source param given to that partition.=C2=A0 For e=
xample, if the</div>
<div>- =C2=A0 =C2=A0partition is set up like this:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0part /boot --source bootimg-pcbios =C2=A0 ...</d=
iv>
<div>-</div>
<div>- =C2=A0 =C2=A0then the methods defined as class members of the plugin=
 having the</div>
<div>- =C2=A0 =C2=A0matching bootimg-pcbios .name class member would be use=
d.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0To be more concrete, here&#39;s the plugin definition t=
hat would match</div>
<div>- =C2=A0 =C2=A0a &#39;--source bootimg-pcbios&#39; usage, along with a=
n example method</div>
<div>- =C2=A0 =C2=A0that would be called by the wic implementation when it =
needed to</div>
<div>- =C2=A0 =C2=A0invoke an implementation-specific partition-preparation=
 function:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0class BootimgPcbiosPlugin(<wbr>SourcePlugin):</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D &#39;bootimg-pcbios&#39;</div>
<div>+wic_cp_description =3D &quot;&quot;&quot;</div>
<div>+This command copies files and directories to the vfat or ext* partiti=
on of</div>
<div>+the partitioned image.</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0@classmethod</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0def do_prepare_partition(self, part, ...)=
</div>
<div>-</div>
<div>- =C2=A0 =C2=A0If the subclass itself doesn&#39;t implement a function=
, a &#39;default&#39;</div>
<div>- =C2=A0 =C2=A0version in a superclass will be located and used, which=
 is why all</div>
<div>- =C2=A0 =C2=A0plugins must be derived from SourcePlugin.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The SourcePlugin class defines the following methods, w=
hich is the</div>
<div>- =C2=A0 =C2=A0current set of methods that can be implemented/overridd=
en by</div>
<div>- =C2=A0 =C2=A0--source plugins.=C2=A0 Any methods not implemented by =
a SourcePlugin</div>
<div>- =C2=A0 =C2=A0subclass inherit the implementations present in the Sou=
rcePlugin</div>
<div>- =C2=A0 =C2=A0class (see the SourcePlugin source for details):</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0do_prepare_partition()</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Called to do the actual content po=
pulation for a</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition. In other words, it &#39=
;prepares&#39; the final partition</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image which will be incorporated i=
nto the disk image.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0do_configure_partition()</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Called before do_prepare_partition=
(), typically used to</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create custom configuration files =
for a partition, for</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0example syslinux or grub config fi=
les.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0do_install_disk()</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Called after all partitions have b=
een prepared and assembled</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0into a disk image.=C2=A0 This prov=
ides a hook to allow</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0finalization of a disk image, for =
example to write an MBR to</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0do_stage_partition()</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Special content-staging hook calle=
d before</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_prepare_partition(), normally e=
mpty.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Typically, a partition will just u=
se the passed-in</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parameters, for example the unmodi=
fied value of bootimg_dir.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In some cases however, things may =
need to be more tailored.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0As an example, certain files may a=
dditionally need to be</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0take from bootimg_dir + /boot.=C2=
=A0 This hook allows those files</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to be staged in a customized fashi=
on.=C2=A0 Note that</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_bitbake_var() allows you to ac=
cess non-standard</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variables that you might want to u=
se for these types of</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0situations.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0This scheme is extensible - adding more hooks is a simp=
le matter</div>
<div>- =C2=A0 =C2=A0of adding more plugin methods to SourcePlugin and deriv=
ed classes.</div>
<div>- =C2=A0 =C2=A0Please see the implementation for details.</div>
<div>+Copies file or directory to the specified directory</div>
<div>+on the partition:</div>
<div>+ =C2=A0 $ wic cp test tmp/deploy/images/qemux86-64/<wbr>core-image-mi=
nimal-qemux86-64.<wbr>wic:1/efi/</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_overview_help =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic overview - General overview of wic</div>
<div>-</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0The &#39;wic&#39; command generates partitioned images =
from existing</div>
<div>- =C2=A0 =C2=A0OpenEmbedded build artifacts.=C2=A0 Image generation is=
 driven by</div>
<div>- =C2=A0 =C2=A0partitioning commands contained in an &#39;Openembedded=
 kickstart&#39;</div>
<div>- =C2=A0 =C2=A0(.wks) file (see &#39;wic help kickstart&#39;) specifie=
d either directly</div>
<div>- =C2=A0 =C2=A0on the command-line or as one of a selection of canned =
.wks files</div>
<div>- =C2=A0 =C2=A0(see &#39;wic list images&#39;).=C2=A0 When applied to =
a given set of build</div>
<div>- =C2=A0 =C2=A0artifacts, the result is an image or set of images that=
 can be</div>
<div>- =C2=A0 =C2=A0directly written onto media and used on a particular sy=
stem.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The &#39;wic&#39; command and the infrastructure it&#39=
;s based on is by</div>
<div>- =C2=A0 =C2=A0definition incomplete - its purpose is to allow the gen=
eration of</div>
<div>- =C2=A0 =C2=A0customized images, and as such was designed to be compl=
etely</div>
<div>- =C2=A0 =C2=A0extensible via a plugin interface (see &#39;wic help pl=
ugins&#39;).</div>
<div>-</div>
<div>- =C2=A0Background and Motivation</div>
<div>-</div>
<div>- =C2=A0 =C2=A0wic is meant to be a completely independent standalone =
utility</div>
<div>- =C2=A0 =C2=A0that initially provides easier-to-use and more flexible=
</div>
<div>- =C2=A0 =C2=A0replacements for a couple bits of existing functionalit=
y in</div>
<div>- =C2=A0 =C2=A0oe-core: directdisk.bbclass and mkefidisk.sh.=C2=A0 The=
 difference</div>
<div>- =C2=A0 =C2=A0between wic and those examples is that with wic the fun=
ctionality</div>
<div>- =C2=A0 =C2=A0of those scripts is implemented by a general-purpose pa=
rtitioning</div>
<div>- =C2=A0 =C2=A0&#39;language&#39; based on Redhat kickstart syntax).</=
div>
<div>-</div>
<div>- =C2=A0 =C2=A0The initial motivation and design considerations that l=
ead to the</div>
<div>- =C2=A0 =C2=A0current tool are described exhaustively in Yocto Bug #3=
847</div>
<div>- =C2=A0 =C2=A0(<a href=3D"https://bugzilla.yoctoproject.org/show_bug.=
cgi?id=3D3847" target=3D"_blank">https://bugzilla.<wbr>yoctoproject.org/sho=
w_bug.cgi?<wbr>id=3D3847</a>).</div>
<div>-</div>
<div>- =C2=A0Implementation and Examples</div>
<div>-</div>
<div>- =C2=A0 =C2=A0wic can be used in two different modes, depending on ho=
w much</div>
<div>- =C2=A0 =C2=A0control the user needs in specifying the Openembedded b=
uild</div>
<div>- =C2=A0 =C2=A0artifacts that will be used in creating the image: &#39=
;raw&#39; and</div>
<div>- =C2=A0 =C2=A0&#39;cooked&#39;.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0If used in &#39;raw&#39; mode, artifacts are explicitly=
 specified via</div>
<div>- =C2=A0 =C2=A0command-line arguments (see example below).</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The more easily usable &#39;cooked&#39; mode uses the c=
urrent MACHINE</div>
<div>- =C2=A0 =C2=A0setting and a specified image name to automatically loc=
ate the</div>
<div>- =C2=A0 =C2=A0artifacts used to create the image.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0OE kickstart files (.wks) can of course be specified di=
rectly on</div>
<div>- =C2=A0 =C2=A0the command-line, but the user can also choose from a s=
et of</div>
<div>- =C2=A0 =C2=A0&#39;canned&#39; .wks files available via the &#39;wic =
list images&#39; command</div>
<div>- =C2=A0 =C2=A0(example below).</div>
<div>-</div>
<div>- =C2=A0 =C2=A0In any case, the prerequisite for generating any image =
is to have</div>
<div>- =C2=A0 =C2=A0the build artifacts already available.=C2=A0 The below =
examples assume</div>
<div>- =C2=A0 =C2=A0the user has already build a &#39;core-image-minimal&#3=
9; for a specific</div>
<div>- =C2=A0 =C2=A0machine (future versions won&#39;t require this redunda=
nt step, but</div>
<div>- =C2=A0 =C2=A0for now that&#39;s typically how build artifacts get ge=
nerated).</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The other prerequisite is to source the build environme=
nt:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0$ source oe-init-build-env</div>
<div>-</div>
<div>- =C2=A0 =C2=A0To start out with, we&#39;ll generate an image from one=
 of the canned</div>
<div>- =C2=A0 =C2=A0.wks files.=C2=A0 The following generates a list of ava=
ilailable</div>
<div>- =C2=A0 =C2=A0images:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0$ wic list images</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0mkefidisk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Create an EFI disk image</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0directdisk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Create a &#39;pcbios&#39; direct disk image</div>
<div>-</div>
<div>- =C2=A0 =C2=A0You can get more information about any of the available=
 images by</div>
<div>- =C2=A0 =C2=A0typing &#39;wic list xxx help&#39;, where &#39;xxx&#39;=
 is one of the image names:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0$ wic list mkefidisk help</div>
<div>-</div>
<div>- =C2=A0 =C2=A0Creates a partitioned EFI disk image that the user can =
directly dd</div>
<div>- =C2=A0 =C2=A0to boot media.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0At any time, you can get help on the &#39;wic&#39; comm=
and or any</div>
<div>- =C2=A0 =C2=A0subcommand (currently &#39;list&#39; and &#39;create&#3=
9;).=C2=A0 For instance, to get</div>
<div>- =C2=A0 =C2=A0the description of &#39;wic create&#39; command and its=
 parameters:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0$ wic create</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 Usage:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 Create a new OpenEmbedded image</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 usage: wic create &lt;wks file or image name&gt=
; [-o &lt;DIRNAME&gt; | ...]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-i &lt;JSON PROPERTY FILE&=
gt; | --infile &lt;JSON PROPERTY_FILE&gt;]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-e | --image-name] [-s, --=
skip-build-check] [-D, --debug]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-r, --rootfs-dir] [-b, --b=
ootimg-dir] [-k, --kernel-dir]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-n, --native-sysroot] [-f,=
 --build-rootfs]</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 This command creates an OpenEmbedded image base=
d on the &#39;OE</div>
<div>- =C2=A0 =C2=A0 =C2=A0 kickstart commands&#39; found in the &lt;wks fi=
le&gt;.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 The -o option can be used to place the image in=
 a directory</div>
<div>- =C2=A0 =C2=A0 =C2=A0 with a different name and location.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 See &#39;wic help create&#39; for more detailed=
 instructions.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 ...</div>
<div>-</div>
<div>- =C2=A0 =C2=A0As mentioned in the command, you can get even more deta=
iled</div>
<div>- =C2=A0 =C2=A0information by adding &#39;help&#39; to the above:</div=
>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0$ wic help create</div>
<div>-</div>
<div>- =C2=A0 =C2=A0So, the easiest way to create an image is to use the -e=
 option</div>
<div>- =C2=A0 =C2=A0with a canned .wks file.=C2=A0 To use the -e option, yo=
u need to</div>
<div>- =C2=A0 =C2=A0specify the image used to generate the artifacts and yo=
u actually</div>
<div>- =C2=A0 =C2=A0need to have the MACHINE used to build them specified i=
n your</div>
<div>- =C2=A0 =C2=A0local.conf (these requirements aren&#39;t necessary if =
you aren&#39;t</div>
<div>- =C2=A0 =C2=A0using the -e options.) =C2=A0Below, we generate a direc=
tdisk image,</div>
<div>- =C2=A0 =C2=A0pointing the process at the core-image-minimal artifact=
s for the</div>
<div>- =C2=A0 =C2=A0current MACHINE:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0$ wic create directdisk -e core-image-minimal</d=
iv>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0Checking basic build environment...</div>
<div>- =C2=A0 =C2=A0 =C2=A0Done.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0Creating image(s)...</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0Info: The new image(s) can be found here:</div>
<div>- =C2=A0 =C2=A0 =C2=A0/var/tmp/wic/build/<wbr>directdisk-201309252350-=
sda.<wbr>direct</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0The following build artifacts were used to creat=
e the image(s):</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0ROOTFS_DIR: =C2=A0 =C2=A0 =C2=A0...</div>
<div>- =C2=A0 =C2=A0 =C2=A0BOOTIMG_DIR: =C2=A0 =C2=A0 ...</div>
<div>- =C2=A0 =C2=A0 =C2=A0KERNEL_DIR: =C2=A0 =C2=A0 =C2=A0...</div>
<div>- =C2=A0 =C2=A0 =C2=A0NATIVE_SYSROOT: =C2=A0...</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0The image(s) were created using OE kickstart fil=
e:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0.../scripts/lib/wic/canned-<wbr>wks/direc=
tdisk.wks</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The output shows the name and location of the image cre=
ated, and</div>
<div>- =C2=A0 =C2=A0so that you know exactly what was used to generate the =
image, each</div>
<div>- =C2=A0 =C2=A0of the artifacts and the kickstart file used.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0Similarly, you can create a &#39;mkefidisk&#39; image i=
n the same way</div>
<div>- =C2=A0 =C2=A0(notice that this example uses a different machine - be=
cause it&#39;s</div>
<div>- =C2=A0 =C2=A0using the -e option, you need to change the MACHINE in =
your</div>
<div>- =C2=A0 =C2=A0local.conf):</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0$ wic create mkefidisk -e core-image-minimal</di=
v>
<div>- =C2=A0 =C2=A0 =C2=A0Checking basic build environment...</div>
<div>- =C2=A0 =C2=A0 =C2=A0Done.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0Creating image(s)...</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0Info: The new image(s) can be found here:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 /var/tmp/wic/build/mkefidisk-<wbr>201309=
260027-sda.direct</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0...</div>
<div>-</div>
<div>- =C2=A0 =C2=A0Here&#39;s an example that doesn&#39;t take the easy wa=
y out and manually</div>
<div>- =C2=A0 =C2=A0specifies each build artifact, along with a non-canned =
.wks file,</div>
<div>- =C2=A0 =C2=A0and also uses the -o option to have wic create the outp=
ut</div>
<div>- =C2=A0 =C2=A0somewhere other than the default /var/tmp/wic:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0$ wic create ./test.wks -o ./out --rootfs-dir</d=
iv>
<div>- =C2=A0 =C2=A0 =C2=A0tmp/work/qemux86_64-poky-<wbr>linux/core-image-m=
inimal/1.0-<wbr>r0/rootfs</div>
<div>- =C2=A0 =C2=A0 =C2=A0--bootimg-dir tmp/sysroots/qemux86-64/usr/<wbr>s=
hare</div>
<div>- =C2=A0 =C2=A0 =C2=A0--kernel-dir tmp/deploy/images/qemux86-64</div>
<div>- =C2=A0 =C2=A0 =C2=A0--native-sysroot tmp/sysroots/x86_64-linux</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 Creating image(s)...</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 Info: The new image(s) can be found here:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out/build/test-201507211313-<wbr>=
sda.direct</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 The following build artifacts were used to create the =
image(s):</div>
<div>- =C2=A0 =C2=A0 =C2=A0 ROOTFS_DIR: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp/work/qemux86_64-poky-<wbr>linux/core-image-=
minimal/1.0-<wbr>r0/rootfs</div>
<div>- =C2=A0 =C2=A0 =C2=A0 BOOTIMG_DIR: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp/sysroots/qemux86-64/usr/<wbr>share</div>
<div>- =C2=A0 =C2=A0 =C2=A0 KERNEL_DIR: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp/deploy/images/qemux86-64</div>
<div>- =C2=A0 =C2=A0 =C2=A0 NATIVE_SYSROOT: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tmp/sysroots/x86_64-linux</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 The image(s) were created using OE kickstart file:</di=
v>
<div>- =C2=A0 =C2=A0 ./test.wks</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 Here is a content of test.wks:</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0 part /boot --source bootimg-pcbios --ondisk sda --labe=
l boot --active --align 1024</div>
<div>- =C2=A0 =C2=A0 part / --source rootfs --ondisk sda --fstype=3Dext3 --=
label platform --align 1024</div>
<div>+wic_rm_description =3D &quot;&quot;&quot;</div>
<div>+This command removes files or directories from the vfat or ext* parti=
tion of the</div>
<div>+partitioned image: wic rm &lt;wic image&gt;:&lt;partition&gt;&lt;path=
&gt;=C2=A0</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0 bootloader =C2=A0--timeout=3D0 =C2=A0--append=3D&quot;=
rootwait rootfstype=3Dext3 video=3Dvesafb vga=3D0x318 console=3Dtty0&quot;<=
/div>
<div>+$wic rm ./tmp/deploy/images/qemux86-<wbr>64/core-image-minimal-qemux8=
6-<wbr>64.wic:1/libutil.c32=C2=A0</div>
<div>=C2=A0</div>
<div>-</div>
<div>- =C2=A0 =C2=A0Finally, here&#39;s an example of the actual partition =
language</div>
<div>- =C2=A0 =C2=A0commands used to generate the mkefidisk image i.e. thes=
e are the</div>
<div>- =C2=A0 =C2=A0contents of the mkefidisk.wks OE kickstart file:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0# short-description: Create an EFI disk image</d=
iv>
<div>- =C2=A0 =C2=A0 =C2=A0# long-description: Creates a partitioned EFI di=
sk image that the user</div>
<div>- =C2=A0 =C2=A0 =C2=A0# can directly dd to boot media.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0part /boot --source bootimg-efi --ondisk sda --f=
stype=3Defi --active</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0part / --source rootfs --ondisk sda --fstype=3De=
xt3 --label platform</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0part swap --ondisk sda --size 44 --label swap1 -=
-fstype=3Dswap</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0bootloader =C2=A0--timeout=3D10 =C2=A0--append=
=3D&quot;rootwait console=3DttyPCH0,115200&quot;</div>
<div>-</div>
<div>- =C2=A0 =C2=A0You can get a complete listing and description of all t=
he</div>
<div>- =C2=A0 =C2=A0kickstart commands available for use in .wks files from=
 &#39;wic help</div>
<div>- =C2=A0 =C2=A0kickstart&#39;.</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0</div>
<div>-wic_kickstart_help =3D &quot;&quot;&quot;</div>
<div>-</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic kickstart - wic kickstart reference</div>
<div>-</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0This section provides the definitive reference to the w=
ic</div>
<div>- =C2=A0 =C2=A0kickstart language.=C2=A0 It also provides documentatio=
n on the list of</div>
<div>- =C2=A0 =C2=A0--source plugins available for use from the &#39;part&#=
39; command (see</div>
<div>- =C2=A0 =C2=A0the &#39;Platform-specific Plugins&#39; section below).=
</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The current wic implementation supports only the basic =
kickstart</div>
<div>- =C2=A0 =C2=A0partitioning commands: partition (or part for short) an=
d</div>
<div>- =C2=A0 =C2=A0bootloader.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0The following is a listing of the commands, their synta=
x, and</div>
<div>- =C2=A0 =C2=A0meanings. The commands are based on the Fedora kickstar=
t</div>
<div>- =C2=A0 =C2=A0documentation but with modifications to reflect wic cap=
abilities.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0<a href=3D"http://fedoraproject.org/wiki/Anacond=
a/Kickstart#part_or_partition" target=3D"_blank">http://fedoraproject.org/<=
wbr>wiki/Anaconda/Kickstart#part_<wbr>or_partition</a></div>
<div>- =C2=A0 =C2=A0 =C2=A0<a href=3D"http://fedoraproject.org/wiki/Anacond=
a/Kickstart#bootloader" target=3D"_blank">http://fedoraproject.org/<wbr>wik=
i/Anaconda/Kickstart#<wbr>bootloader</a></div>
<div>-</div>
<div>- =C2=A0Commands</div>
<div>-</div>
<div>- =C2=A0 =C2=A0* &#39;part&#39; or &#39;partition&#39;</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 This command creates a partition on the system =
and uses the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 following syntax:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 part [&lt;mountpoint&gt;]</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 The &lt;mountpoint&gt; is where the partition w=
ill be mounted and</div>
<div>- =C2=A0 =C2=A0 =C2=A0 must take of one of the following forms:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 /&lt;path&gt;: For example: /, /usr, or =
/home</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 swap: The partition will be used as swap=
 space.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 If a &lt;mountpoint&gt; is not specified the pa=
rtition will be created</div>
<div>- =C2=A0 =C2=A0 =C2=A0 but will not be mounted.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 Partitions with a &lt;mountpoint&gt; specified =
will be automatically mounted.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 This is achieved by wic adding entries to the f=
stab during image</div>
<div>- =C2=A0 =C2=A0 =C2=A0 generation. In order for a valid fstab to be ge=
nerated one of the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 --ondrive, --ondisk or --use-uuid partition opt=
ions must be used for</div>
<div>- =C2=A0 =C2=A0 =C2=A0 each partition that specifies a mountpoint.</di=
v>
<div>-</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 The following are supported &#39;part&#39; opti=
ons:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --size: The minimum partition size. Spec=
ify an integer value</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 such as 500.=
 Multipliers k, M ang G can be used. If</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 not specifie=
d, the size is in MB.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 You do not n=
eed this option if you use --source.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --fixed-size: Exact partition size. Valu=
e format is the same</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 as for --size option. This option cannot be</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 specified along with --size. If partition data</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 is larger than --fixed-size and error will be</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 raised when assembling disk image.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --source: This option is a wic-specific =
option that names the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sourc=
e of the data that will populate the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parti=
tion.=C2=A0 The most common value for this option</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is &#=
39;rootfs&#39;, but can be any value which maps to a</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 valid=
 &#39;source plugin&#39; (see &#39;wic help plugins&#39;).</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If &#=
39;--source rootfs&#39; is used, it tells the wic</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comma=
nd to create a partition as large as needed</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and t=
o fill it with the contents of the root</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files=
ystem pointed to by the &#39;-r&#39; wic command-line</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optio=
n (or the equivalent rootfs derived from the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
-e&#39; command-line option).=C2=A0 The filesystem type</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 that =
will be used to create the partition is driven</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 by th=
e value of the --fstype option specified for</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the p=
artition (see --fstype below).</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If --=
source &lt;plugin-name&gt;&#39; is used, it tells the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wic c=
ommand to create a partition as large as</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 neede=
d and to fill with the contents of the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parti=
tion that will be generated by the specified</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 plugi=
n name using the data pointed to by the &#39;-r&#39;</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wic c=
ommand-line option (or the equivalent rootfs</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deriv=
ed from the &#39;-e&#39; command-line option).</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Exact=
ly what those contents and filesystem type end</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 up be=
ing are dependent on the given plugin</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imple=
mentation.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If --=
source option is not used, the wic command</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 will =
create empty partition. --size parameter has</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to be=
 used to specify size of empty partition.</div>
<div>+wic_write_description =3D &quot;&quot;&quot;</div>
<div>+This command writes an image to a target device (USB stick, SD card e=
tc)</div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --ondisk or --ondrive: Forces the partit=
ion to be created on</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a particular disk.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --fstype: Sets the file system type for =
the partition.=C2=A0 These</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 apply to partitions created using=
 &#39;--source rootfs&#39; (see</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --source above).=C2=A0 Valid valu=
es are:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vfat</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msdos</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ext2</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ext3</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ext4</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 btrfs</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 squashfs</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 swap</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --fsoptions: Specifies a free-form strin=
g of options to be</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0used when mounting the filesystem. This string</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0will be copied into the /etc/fstab file of the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0installed system and should be enclosed in</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0quotes.=C2=A0 If not specified, the default string is</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;defaults&quot;.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --label label: Specifies the label to gi=
ve to the filesystem</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0to be made on the partition. If the given</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0label is already in use by another filesystem,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0a new label is created for the partition.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --active: Marks the partition as active.=
</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --align (in KBytes): This option is spec=
ific to wic and says</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to start a partition on an x KBytes</=
div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boundary.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --no-table: This option is specific to w=
ic. Space will be</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reserved for the partition and it will be</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 populated but it will not be added to the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 partition table. It may be useful for</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bootloaders.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --exclude-path: This option is specific =
to wic. It excludes the given</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 relative path from the resulting image. If the path</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ends with a slash, only the content of the directory</div=
>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 is omitted, not the directory itself. This option only</d=
iv>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 has an effect with the rootfs source plugin.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --extra-space: This option is specific t=
o wic. It adds extra</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0space after the space filled by the content</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0of the partition. The final size can go</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0beyond the size specified by --size.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0By default, 10MB. This option cannot be used</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0with --fixed-size option.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --overhead-factor: This option is specif=
ic to wic. The</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size of the partition is multiplied by</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this factor. It has to be greater than or</d=
iv>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0equal to 1. The default value is 1.3.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option cannot be used with --fixed-size=
</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0option.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --part-name: This option is specific to =
wic. It specifies name for GPT partitions.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --part-type: This option is specific to =
wic. It specifies partition</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0type GUID for GPT partitions.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0List of partition type GUIDS can be found here:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"http://en.wikipedia.org/wiki/GUID_Partition_Table#Part=
ition_type_GUIDs" target=3D"_blank">http://en.wikipedia.org/wiki/<wbr>GUID_=
Partition_Table#<wbr>Partition_type_GUIDs</a></div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --use-uuid: This option is specific to w=
ic. It makes wic to generate</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 random globally unique identifier (GUID) for the partition</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 and use it in bootloader configuration to specify root partition.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --uuid: This option is specific to wic. =
It specifies partition UUID.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 It&#39;s use=
ful if preconfigured partition UUID is added to kernel command line</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in bootloade=
r configuration before running wic. In this case .wks file can</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be generated=
 or modified to set preconfigured parition UUID using this option.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --system-id: This option is specific to =
wic. It specifies partition system id. It&#39;s useful</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for the harware that requires non-default partition system ids. T=
he parameter</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0in one byte long hex number either with 0x prefix or without it.<=
/div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 --mkfs-extraopts: This option specifies =
extra options to pass to mkfs utility.</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NOTE, that wic uses default options for some files=
ystems, for example</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-S 512&#39; for mkfs.fat or &#39;-F -i 8192&#=
39; for mkfs.ext. Those options will</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 not take effect when --mkfs-extraopts is used. Thi=
s should be taken into</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 account when using --mkfs-extraopts.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0* bootloader</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0This command allows the user to specify various =
bootloader</div>
<div>- =C2=A0 =C2=A0 =C2=A0options.=C2=A0 The following are supported &#39;=
bootloader&#39; options:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0--timeout: Specifies the number of second=
s before the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bootl=
oader times out and boots the default option.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0--append: Specifies kernel parameters. Th=
ese will be added to</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootlo=
ader command-line - for example, the syslinux</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APPEND=
 or grub kernel command line.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0--configfile: Specifies a user defined co=
nfiguration file for</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0the bootloader. This file must be located in the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0canned-wks folder or could be the full path to the</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0file. Using this option will override any other</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bootloader option.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0Note that bootloader functionality and boot part=
itions are</div>
<div>- =C2=A0 =C2=A0 =C2=A0implemented by the various --source plugins that=
 implement</div>
<div>- =C2=A0 =C2=A0 =C2=A0bootloader functionality; the bootloader command=
 essentially</div>
<div>- =C2=A0 =C2=A0 =C2=A0provides a means of modifying bootloader configu=
ration.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0* include</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0This command allows the user to include the cont=
ent of .wks file</div>
<div>- =C2=A0 =C2=A0 =C2=A0into original .wks file.</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0Command uses the following syntax:</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 include &lt;file&gt;</div>
<div>-</div>
<div>- =C2=A0 =C2=A0 =C2=A0The &lt;file&gt; is either path to the file or i=
ts name. If name is</div>
<div>- =C2=A0 =C2=A0 =C2=A0specified wic will try to find file in the direc=
tories with canned</div>
<div>- =C2=A0 =C2=A0 =C2=A0.wks files.</div>
<div>-</div>
<div>-&quot;&quot;&quot;</div>
<div>+ =C2=A0 =C2=A0$ wic write ./tmp/deploy/images/qemux86-<wbr>64/core-im=
age-minimal-qemux86-<wbr>64.wic /dev/sdb</div>
<div>=C2=A0</div>
<div>-wic_help_help =3D &quot;&quot;&quot;</div>
<div>-NAME</div>
<div>- =C2=A0 =C2=A0wic help - display a help topic</div>
<div>+The --expand option is used to resize image partitions.</div>
<div>+--expand auto expands partitions to occupy all free space available o=
n the target device.</div>
<div>+It&#39;s also possible to specify expansion rules in a format</div>
<div>+&lt;partition&gt;:&lt;size&gt;[-&lt;<wbr>partition&gt;:&lt;size&gt;..=
.] for one or more partitions.</div>
<div>+Specifying size 0 will keep partition unmodified.</div>
<div>+Note: Resizing boot partition can result in non-bootable image for no=
n-EFI images. It is</div>
<div>+recommended to use size 0 for boot partition to keep image bootable.<=
/div>
<div>=C2=A0</div>
<div>-DESCRIPTION</div>
<div>- =C2=A0 =C2=A0Specify a help topic to display it. Topics are shown ab=
ove.</div>
<div>=C2=A0&quot;&quot;&quot;</div>
<div>diff --git a/scripts/wic b/scripts/wic</div>
<div>index 097084a..cb348e3 100755</div>
<div>--- a/scripts/wic</div>
<div>+++ b/scripts/wic</div>
<div>@@ -106,7 +106,7 @@ class RootfsArgAction(argparse.<wbr>Action):</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0namespace.__dict__[&#39;rootfs_<wbr>=
dir&#39;][key] =3D rootfs_dir</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>-def wic_create_subcommand(options, usage_str):</div>
<div>+def wic_create_subcommand(options)<wbr>:</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0Command-line handling for image creation.=C2=A0 Th=
e real work is done</div>
<div>=C2=A0 =C2=A0 =C2=A0by image.engine.wic_create()</div>
<div>@@ -177,7 +177,7 @@ def wic_create_subcommand(options, usage_str):</di=
v>
<div>=C2=A0 =C2=A0 =C2=A0wks_file =3D options.wks_file</div>
<div>=C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0if not wks_file.endswith(&quot;.wks&quot;):</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0wks_file =3D engine.find_canned_image(<wb=
r>scripts_path, wks_file)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0wks_file =3D engine.find_canned_image(wks=
_<wbr>file)</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not wks_file:</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicError(&quot;N=
o image named %s found, exiting. =C2=A0(Use &#39;wic list images&#39; &quot=
;</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;to list available images, or specify a fu=
lly-qualified OE &quot;</div>
<div>@@ -227,91 +227,44 @@ def wic_create_subcommand(options, usage_str):</=
div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0native_sysroot, options)</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>-def wic_list_subcommand(args, usage_str):</div>
<div>+def wic_list_subcommand(args):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0Command-line handling for listing available images=
.</div>
<div>=C2=A0 =C2=A0 =C2=A0The real work is done by image.engine.wic_list()</=
div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0if not engine.wic_list(args, scripts_path):</div>
<div>+ =C2=A0 =C2=A0if not engine.wic_list(scripts_path, args):</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicError(&quot;Bad list argume=
nts, exiting&quot;)</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>-def wic_ls_subcommand(args, usage_str):</div>
<div>+def wic_ls_subcommand(args):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0Command-line handling for list content of images.<=
/div>
<div>=C2=A0 =C2=A0 =C2=A0The real work is done by engine.wic_ls()</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0engine.wic_ls(args, args.native_sysroot)</div>
<div>=C2=A0</div>
<div>-def wic_cp_subcommand(args, usage_str):</div>
<div>+def wic_cp_subcommand(args):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0Command-line handling for copying files/dirs to im=
ages.</div>
<div>=C2=A0 =C2=A0 =C2=A0The real work is done by engine.wic_cp()</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0engine.wic_cp(args, args.native_sysroot)</div>
<div>=C2=A0</div>
<div>-def wic_rm_subcommand(args, usage_str):</div>
<div>+def wic_rm_subcommand(args):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0Command-line handling for removing files/dirs from=
 images.</div>
<div>=C2=A0 =C2=A0 =C2=A0The real work is done by engine.wic_rm()</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0engine.wic_rm(args, args.native_sysroot)</div>
<div>=C2=A0</div>
<div>-def wic_write_subcommand(args, usage_str):</div>
<div>+def wic_write_subcommand(args):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0Command-line handling for writing images.</div>
<div>=C2=A0 =C2=A0 =C2=A0The real work is done by engine.wic_write()</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0engine.wic_write(args, args.native_sysroot)</div>
<div>=C2=A0</div>
<div>-def wic_help_subcommand(args, usage_str):</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0Command-line handling for help subcommand to keep the c=
urrent</div>
<div>- =C2=A0 =C2=A0structure of the function definitions.</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0pass</div>
<div>-</div>
<div>=C2=A0</div>
<div>-def wic_help_topic_subcommand(<wbr>usage_str, help_str):</div>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0Display function for help &#39;sub-subcommands&#39;.</d=
iv>
<div>- =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>- =C2=A0 =C2=A0print(help_str)</div>
<div>- =C2=A0 =C2=A0return</div>
<div>-</div>
<div>-</div>
<div>-wic_help_topic_usage =3D &quot;&quot;&quot;</div>
<div>-&quot;&quot;&quot;</div>
<div>-</div>
<div>-helptopics =3D {</div>
<div>- =C2=A0 =C2=A0&quot;plugins&quot;: =C2=A0 [wic_help_topic_subcommand,=
</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_plugins_help],</div>
<div>- =C2=A0 =C2=A0&quot;overview&quot;: =C2=A0[wic_help_topic_subcommand,=
</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_overview_help],</div>
<div>- =C2=A0 =C2=A0&quot;kickstart&quot;: [wic_help_topic_subcommand,</div=
>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_kickstart_help],</div>
<div>- =C2=A0 =C2=A0&quot;create&quot;: =C2=A0 =C2=A0[wic_help_topic_subcom=
mand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_create_help],</div>
<div>- =C2=A0 =C2=A0&quot;ls&quot;: =C2=A0 =C2=A0 =C2=A0 =C2=A0[wic_help_to=
pic_subcommand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_ls_help],</div>
<div>- =C2=A0 =C2=A0&quot;cp&quot;: =C2=A0 =C2=A0 =C2=A0 =C2=A0[wic_help_to=
pic_subcommand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_cp_help],</div>
<div>- =C2=A0 =C2=A0&quot;rm&quot;: =C2=A0 =C2=A0 =C2=A0 =C2=A0[wic_help_to=
pic_subcommand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_rm_help],</div>
<div>- =C2=A0 =C2=A0&quot;write&quot;: =C2=A0 =C2=A0 [wic_help_topic_subcom=
mand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_write_help],</div>
<div>- =C2=A0 =C2=A0&quot;list&quot;: =C2=A0 =C2=A0 =C2=A0[wic_help_topic_s=
ubcommand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_list_help]</div>
<div>-}</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>=C2=A0def wic_init_parser_create(<wbr>subparser):</div>
<div>@@ -333,17 +286,15 @@ def wic_init_parser_create(<wbr>subparser):</div=
>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0help=3D&quot;path to the dir containing the kernel to use &quo=
t;</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;in the .wks bootimg&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-n&quot;, &quot;--nat=
ive-sysroot&quot;, dest=3D&quot;native_sysroot&quot;,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0help=3D&quot;path to the native sysroot containing the tools &quo=
t;</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;to use to build the image&quot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0help=3D&quot;path to the native sysroot containing the tools (par=
ted and mtools) to use.&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-s&quot;, &quot;--ski=
p-build-check&quot;, dest=3D&quot;build_check&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0action=3D&quot;store_false&quot;, default=3DTrue, help=3D&quot=
;skip the build check&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-f&quot;, &quot;--bui=
ld-rootfs&quot;, action=3D&quot;store_true&quot;, help=3D&quot;build rootfs=
&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-c&quot;, &quot;--com=
press-with&quot;, choices=3D(&quot;gzip&quot;, &quot;bzip2&quot;, &quot;xz&=
quot;),</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dest=3D&#39;compressor&#39;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0help=3D&quot;compress image with specified compressor&quot;)</=
div>
<div>- =C2=A0 =C2=A0subparser.add_argument(&quot;-m&quot;, &quot;--bmap&quo=
t;, action=3D&quot;store_true&quot;, help=3D&quot;generate .bmap&quot;)</di=
v>
<div>- =C2=A0 =C2=A0subparser.add_argument(&quot;--no-<wbr>fstab-update&quo=
t; ,action=3D&quot;store_true&quot;,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0help=3D&quot;Do not change fstab file.&quot;)</div>
<div>+ =C2=A0 =C2=A0subparser.add_argument(&quot;-m&quot;, &quot;--bmap&quo=
t;, action=3D&quot;store_true&quot;, help=3D&quot;used to produce .bmap fil=
e for the image.&quot;</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;This file can be used to flash image using b=
maptool utility&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-v&quot;, &quot;--var=
s&quot;, dest=3D&#39;vars_dir&#39;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0help=3D&quot;directory with &lt;image&gt;.env files that store=
 &quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bitbake variables&quot;)</div>
<div>@@ -357,10 +308,10 @@ def wic_init_parser_list(<wbr>subparser):</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0help=3D&quot;can be &#39;images&#39; or &#39;source-plu=
gins&#39; &quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;to obtain a list. &quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;If value is a valid .wks image fil=
e&quot;)</div>
<div>- =C2=A0 =C2=A0subparser.add_argument(&quot;help_<wbr>for&quot;, defau=
lt=3D[], nargs=3D&#39;*&#39;,</div>
<div>+ =C2=A0 =C2=A0subparser.add_argument(&quot;info_<wbr>for&quot;, defau=
lt=3D[], nargs=3D&#39;*&#39;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0help=3D&quot;If &#39;list_type&#39; is a valid .wks ima=
ge file &quot;</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;this value can be &#39;help&#39; to s=
how the help information &quot;</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;defined inside the .wks file&quot;)</=
div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;this value can be &#39;info&#39; to s=
how the image or plugin information &quot;)</div>
<div>+</div>
<div>=C2=A0 =C2=A0 =C2=A0return</div>
<div>=C2=A0</div>
<div>=C2=A0def imgtype(arg):</div>
<div>@@ -385,9 +336,9 @@ def imgtype(arg):</div>
<div>=C2=A0</div>
<div>=C2=A0def wic_init_parser_ls(subparser):</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;path&quot;<wbr>, type=
=3Dimgtype,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;image spec: &lt;image&gt;[:&lt;vfat partition=
&gt;[&lt;path&gt;]]&quot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;image spec: &lt;image&gt;[:&lt;partition&gt;[=
&lt;path&gt;]]&quot;<wbr>)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-n&quot;, &quot;--nat=
ive-sysroot&quot;,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls&quot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls (parted and mtools) to use.&quot;)</div>
<div>=C2=A0</div>
<div>=C2=A0def imgpathtype(arg):</div>
<div>=C2=A0 =C2=A0 =C2=A0img =3D imgtype(arg)</div>
<div>@@ -399,15 +350,15 @@ def wic_init_parser_cp(subparser):</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;src&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0help=3D&quot;source spec&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;dest&quot;<wbr>, type=
=3Dimgpathtype,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;image spec: &lt;image&gt;:&lt;vfat partition&=
gt;[&lt;path&gt;]&quot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;image spec: &lt;image&gt;:&lt;partition&gt;[&=
lt;path&gt;]&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-n&quot;, &quot;--nat=
ive-sysroot&quot;,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls&quot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls (parted and mtools) to use.&quot;)</div>
<div>=C2=A0</div>
<div>=C2=A0def wic_init_parser_rm(subparser):</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;path&quot;<wbr>, type=
=3Dimgpathtype,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path: &lt;image&gt;:&lt;vfat partition&gt;&lt=
;path&gt;&quot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;image spec: &lt;image&gt;[:&lt;partition&gt;[=
&lt;path&gt;]&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-n&quot;, &quot;--nat=
ive-sysroot&quot;,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls&quot;)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls (parted and mtools) to use.&quot;)</div>
<div>=C2=A0</div>
<div>=C2=A0def expandtype(rules):</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div>@@ -448,59 +399,56 @@ def wic_init_parser_write(<wbr>subparser):</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-e&quot;, &quot;--exp=
and&quot;, type=3Dexpandtype,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0help=3D&quot;expand rules: auto or &lt;partition&gt;:&l=
t;size&gt;[,&lt;<wbr>partition&gt;:&lt;size&gt;]&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-n&quot;, &quot;--nat=
ive-sysroot&quot;,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls&quot;)</div>
<div>-</div>
<div>-def wic_init_parser_help(<wbr>subparser):</div>
<div>- =C2=A0 =C2=A0helpparsers =3D subparser.add_subparsers(dest=3D<wbr>&#=
39;help_topic&#39;, help=3Dhlp.wic_usage)</div>
<div>- =C2=A0 =C2=A0for helptopic in helptopics:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0helpparsers.add_parser(<wbr>helptopic, he=
lp=3Dhelptopics[helptopic][2])</div>
<div>- =C2=A0 =C2=A0return</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls (parted and mtools) to use.&quot;)</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>=C2=A0subcommands =3D {</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;create&quot;: =C2=A0 =C2=A0[wic_create_subco=
mmand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_create_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_create_help,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_create],</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_create_description,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_create,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_create_short_<wbr>description],</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;list&quot;: =C2=A0 =C2=A0 =C2=A0[wic_list_su=
bcommand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_list_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_list_help,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_list],</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_list_description,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_list,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_list_short_<wbr>description],</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;ls&quot;: =C2=A0 =C2=A0 =C2=A0 =C2=A0[wic_ls=
_subcommand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_ls_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_ls_help,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_ls],</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_ls_description,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_ls,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_ls_short_description]<wbr>,</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;cp&quot;: =C2=A0 =C2=A0 =C2=A0 =C2=A0[wic_cp=
_subcommand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_cp_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_cp_help,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_cp],</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_cp_description,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_cp,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_cp_short_description]<wbr>,</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;rm&quot;: =C2=A0 =C2=A0 =C2=A0 =C2=A0[wic_rm=
_subcommand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_rm_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_rm_help,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_rm],</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_rm_description,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_rm,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_rm_short_description]<wbr>,</div>
<div>=C2=A0 =C2=A0 =C2=A0&quot;write&quot;: =C2=A0 =C2=A0 [wic_write_subcom=
mand,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_write_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_write_help,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_write],</div>
<div>- =C2=A0 =C2=A0&quot;help&quot;: =C2=A0 =C2=A0 =C2=A0[wic_help_subcomm=
and,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_he=
lp_topic_usage,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_help_help,</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_help]</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_write_description,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wic_in=
it_parser_write,</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlp.wi=
c_write_short_<wbr>description],</div>
<div>=C2=A0}</div>
<div>=C2=A0</div>
<div>+def invoke_subcommand(args, parser, main_command_usage, subcommands):=
</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0subcmd =3D subcommands.get(args.command, =
subcommand_error)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0usage =3D subcmd[1]</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0subcmd[0](args, usage)</div>
<div>+</div>
<div>=C2=A0</div>
<div>=C2=A0def init_parser(parser):</div>
<div>=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;--<wbr>version&quot;, ac=
tion=3D&quot;version&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version=3D&quot;%(prog)s {version}&q=
uot;.format(version=3D__<wbr>version__))</div>
<div>- =C2=A0 =C2=A0subparsers =3D parser.add_subparsers(dest=3D&#39;<wbr>c=
ommand&#39;, help=3Dhlp.wic_usage)</div>
<div>+ =C2=A0 =C2=A0subparsers =3D parser.add_subparsers(dest=3D&#39;<wbr>c=
ommand&#39;)</div>
<div>+ =C2=A0 =C2=A0helpparser =3D subparsers.add_parser(&quot;help&quot;, =
help=3D&quot;Display usages&quot;)</div>
<div>=C2=A0 =C2=A0 =C2=A0for subcmd in subcommands:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0subparser =3D subparsers.add_parser(subcm=
d, help=3Dsubcommands[subcmd][2])</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0subcommands[subcmd][3](<wbr>subparser)</d=
iv>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0subparser =3D subparsers.add_parser(subcm=
d, help=3Dsubcommands[subcmd][3], formatter_class=3Dargparse.<wbr>RawDescri=
ptionHelpFormatter, description=3Dsubcommands[<wbr>subcmd][1])</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0subcommands[subcmd][2](<wbr>subparser)</d=
iv>
<div>+</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<div>=C2=A0def main(argv):</div>
<div>=C2=A0 =C2=A0 =C2=A0parser =3D argparse.ArgumentParser(</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0description=3D&quot;wic version %s&quot; =
% __version__)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0description=3D&quot;Create a customized O=
penEmbedded image. Wic version %s&quot; % __version__)</div>
<div>=C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0init_parser(parser)</div>
<div>=C2=A0</div>
<div>@@ -508,22 +456,15 @@ def main(argv):</div>
<div>=C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0if &quot;command&quot; in vars(args):</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if args.command =3D=3D &quot;help&qu=
ot;:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if args.help_topic is None:=
</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parser.print_=
help()</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print()</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;P=
lease specify a help topic&quot;)</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif args.help_topic in hel=
ptopics:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlpt =3D help=
topics[args.help_topic]</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hlpt[0](hlpt[=
1], hlpt[2])</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0</div>
<div>-</div>
<div>- =C2=A0 =C2=A0return hlp.invoke_subcommand(args, parser, hlp.wic_help=
_usage, subcommands)</div>
<div>-</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parser.print_help()</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print()</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else:</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subcmd =3D subcommands.get(=
args.command)</div>
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subcmd[0](args)</div>
<div>=C2=A0</div>
<div>=C2=A0if __name__ =3D=3D &quot;__main__&quot;:</div>
<div>=C2=A0 =C2=A0 =C2=A0try:</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(main(sys.argv[1:]))</div>
<div>=C2=A0 =C2=A0 =C2=A0except WicError as err:</div>
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0print()</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(err)</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(1)</div><span class=3D"HOEn=
Zb"><font color=3D"#888888">
<div>--=C2=A0</div>
<div>2.7.4</div>
<div><br>
</div>
</font></span></div>
<div>
<div id=3D"m_4720050032115839289MAC_OUTLOOK_SIGNATURE"></div>
</div>
</div>

<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a114387b8b3019c0560234a2c--
